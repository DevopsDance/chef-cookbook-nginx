# Example:
#
# nginx_site 'google.pl' do
#   action :enable
#   site_template true
# end
#
# nginx_site 'google.com' do
#   action :disable
# end

resource_name :nginx_site

default_action :enable

property :site_name, String, name_property: true
property :site_template, [TrueClass, FalseClass], default: false
property :site_variables, Hash, default: {}
property :nginx_dir, String, default: node['nginx']['dir']
property :replace, [String, NilClass], default: nil

action :disable do
  file "#{nginx_dir}/sites-enabled/#{site_name}" do
    notifies :reload, 'service[nginx]', :delayed
    action :delete
  end
end

action :enable do
  template "#{nginx_dir}/sites-available/#{site_name}" do
    owner 'root'
    group 'root'
    mode 00644
    source "#{site_name}.erb"
    variables site_variables
    only_if { site_template }
  end

  cookbook_file "#{nginx_dir}/sites-available/#{site_name}" do
    owner 'root'
    group 'root'
    mode 00640
    notifies :reload, 'service[nginx]', :delayed
    not_if { site_template }
    action :create
  end

  file "#{nginx_dir}/sites-available/#{replace}" do
    notifies :reload, 'service[nginx]', :delayed
    not_if { replace.nil? }
    action :delete
  end

  file "#{nginx_dir}/sites-enabled/#{replace}" do
    notifies :reload, 'service[nginx]', :delayed
    not_if { replace.nil? }
    action :delete
  end


  link "#{nginx_dir}/sites-enabled/#{site_name}" do
    to "#{nginx_dir}/sites-available/#{site_name}"
    notifies :reload, 'service[nginx]', :delayed
  end
end
