name 'devopsdance-nginx'
maintainer 'DevopsDance'
maintainer_email 'team@devops.dance'
license 'Apache-2.0'
description 'Installs and configures NGINX'
version '1.0.0'
source_url 'https://github.com/DevopsDance/chef-cookbook-nginx'
issues_url 'https://github.com/DevopsDance/chef-cookbook-nginx/issues'

depends 'apt'

supports 'ubuntu', '>= 14.04'
supports 'debian', '>= 7.8'
