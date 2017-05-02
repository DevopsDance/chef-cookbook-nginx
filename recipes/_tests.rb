include_recipe 'devopsdance-nginx'

nginx_site 'tests' do
  action :enable
end

nginx_conf 'multi_accept' do
  value 'on'
  context :events
  action :create
end
