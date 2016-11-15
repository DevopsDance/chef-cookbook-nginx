# core context
default['nginx']['conf']['core']['user'] = 'www-data'
default['nginx']['conf']['core']['worker_processes'] = '8'
default['nginx']['conf']['core']['error_log'] = '/var/log/nginx/error.log'
default['nginx']['conf']['core']['pid'] = '/var/run/nginx.pid'

# events context
default['nginx']['conf']['events']['worker_connections'] = '1024'

# http context
default['nginx']['conf']['http']['access_log'] = '/var/log/nginx/access.log'
default['nginx']['conf']['http']['sendfile'] = 'on'
default['nginx']['conf']['http']['tcp_nopush'] = 'on'
default['nginx']['conf']['http']['tcp_nodelay'] = 'on'
default['nginx']['conf']['http']['keepalive_requests'] = '100'
default['nginx']['conf']['http']['keepalive_timeout'] = '65'
default['nginx']['conf']['http']['gzip'] = 'on'
default['nginx']['conf']['http']['gzip_http_version'] = '1.0'
default['nginx']['conf']['http']['gzip_comp_level'] = '2'
default['nginx']['conf']['http']['gzip_proxied'] = 'any'
default['nginx']['conf']['http']['gzip_vary'] = 'off'
default['nginx']['conf']['http']['gzip_types'] = 'text/plain text/css application/x-javascript text/xml application/xml application/rss+xml application/atom+xml text/javascript application/javascript application/json text/mathml'
default['nginx']['conf']['http']['gzip_min_length'] = '1000'
default['nginx']['conf']['http']['gzip_disable'] = 'MSIE [1-6]\.'
default['nginx']['conf']['http']['server_tokens'] = 'off'
