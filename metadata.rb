name 'devopsdance-nginx'
maintainer 'DevopsDance'
maintainer_email 'team@devops.dance'
license 'Apache-2.0'
description 'Installs and configures NGINX'
version '2.0.0'
source_url 'https://github.com/DevopsDance/chef-cookbook-nginx'
issues_url 'https://github.com/DevopsDance/chef-cookbook-nginx/issues'

depends 'apt'

chef_version '~> 12'
chef_version '~> 13'

supports 'ubuntu', '>= 14.04'
supports 'debian', '>= 7.8'
