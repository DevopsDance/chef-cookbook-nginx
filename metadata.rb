name 'nginx'
maintainer 'DevopsDance'
maintainer_email 'team@devops.dance'
license 'All rights reserved'
description 'Installs and configures NGINX'
version '0.1.6'
source_url 'https://github.com/DevopsDance/chef-cookbook-nginx'
issues_url 'https://github.com/DevopsDance/chef-cookbook-nginx/issues'

depends 'apt'

supports 'ubuntu', '>= 14.04'
supports 'debian', '>= 7.8'
