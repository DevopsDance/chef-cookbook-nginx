# Example:
#
# nginx_conf 'server_tokens' do
#   value 'off'
#   action :create
# end

default_action :create

property :config, String, name_property: true
property :context, Symbol, required: true
property :param, String, required: false
property :value, String, required: true
property :nginx_dir, String, default: node['nginx']['dir']

action :create do
  file ::File.join(nginx_dir, 'conf.d', context.to_s, "#{config}.conf") do
    owner 'root'
    group 'root'
    mode 00640
    content <<-CONTENT
# This file is delivered by CHEF.
#
#{param || config} #{value};
    CONTENT
    notifies :reload, 'service[nginx]', :delayed
    action :create
  end
end

action :delete do
  file ::File.join(nginx_dir, 'conf,d', context.to_s, "#{resource_name}.conf") do
    notifies :reload, 'service[nginx]', :delayed
    action :delete
  end
end