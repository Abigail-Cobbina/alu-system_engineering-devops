# Raises the open file limit for Nginx so it handles heavy load
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx; service nginx restart',
  path    => '/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin',
}
