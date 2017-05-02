# Example:
#
# nginx_module 'upstream' do
#   action :disable
# end
#
# nginx_module 'mail' do
#   action :enable
# end

resource_name :nginx_module

default_action :enable

property :module_name, String, name_property: true
property :module_package, String, required: false
property :priority, String, default: '50'
property :nginx_dir, String, default: node['nginx']['dir']
property :nginx_modules_dir, String, default: node['nginx']['modules_dir']

action :enable do
  if node['lsb']['release'].to_i <= 15
    log 'nginx modules are supported by Ubuntu >= 16' do
      level :warning
    end
  else
    package "nginx-module-#{module_name}" do
      package_name "libnginx-mod-http-#{module_name}"
      action :install
      not_if { module_package }
    end

    package "nginx-module-#{module_name}" do
      package_name module_package
      action :install
      only_if { module_package }
    end

    link "#{nginx_dir}/modules-enabled/#{priority}-mod-#{module_name}.conf" do
      to "#{nginx_modules_dir}/mod-#{module_name}.conf"
      notifies :reload, 'service[nginx]', :delayed
    end
  end
end

action :disable do
  file "#{nginx_dir}/modules-enabled/#{priority}-mod-#{module_name}.conf" do
    action :delete
    notifies :reload, 'service[nginx]', :delayed
  end
end
