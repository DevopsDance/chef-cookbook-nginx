%w[core events http].each do |context|
  node['nginx']['conf'][context].each do |name, value|
    nginx_conf name do
      value value
      context context.to_sym
      action :create
    end
  end
end

cookbook_file '/etc/nginx/nginx.conf' do
  source 'nginx.conf'
  owner 'root'
  group 'root'
  mode 00644
  notifies :restart, 'service[nginx]', :delayed
end

nginx_conf 'include_modules' do
  param 'include'
  value '/etc/nginx/modules-enabled/*.conf'
  context :core
  only_if { node['lsb']['release'].to_i >= 16 }
  action :create
end

nginx_module 'mail' do
  only_if { node['nginx']['install']['ppa'] }
  action :disable
end

nginx_module 'stream' do
  only_if { node['nginx']['install']['ppa'] }
  action :disable
end

nginx_site 'default' do
  action :disable
end
