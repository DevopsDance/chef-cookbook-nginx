include_recipe 'nginx'

nginx_site 'tests' do
  action :enable
end
