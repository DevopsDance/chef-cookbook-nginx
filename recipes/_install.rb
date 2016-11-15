include_recipe 'apt'

apt_repository 'nginx' do
  uri 'ppa:nginx/stable'
  distribution node['lsb']['codename']
  action :add
  only_if { node['nginx']['install']['ppa'] && node['platform'] == 'ubuntu' }
end

apt_repository 'nginx' do
  uri 'http://nginx.org/packages/debian/'
  distribution node['lsb']['codename']
  components [
    'nginx'
  ]
  key 'https://nginx.org/keys/nginx_signing.key'
  action :add
  only_if { node['nginx']['install']['nginx_org'] }
end

package node['nginx']['package'] do
  action 'install'
end

package 'nginx-modules' do
  name node['nginx']['modules']
  only_if { node['nginx'].attribute?('modules') }
  action 'install'
end

directory "#{node['nginx']['dir']}/conf.d/core" do
  owner 'root'
  group 'root'
  mode 00750
  action :create
end

directory "#{node['nginx']['dir']}/conf.d/events" do
  owner 'root'
  group 'root'
  mode 00750
  action :create
end

directory "#{node['nginx']['dir']}/conf.d/http" do
  owner 'root'
  group 'root'
  mode 00750
  action :create
end

service 'nginx' do
  action [
    :enable,
    :start
  ]
end
