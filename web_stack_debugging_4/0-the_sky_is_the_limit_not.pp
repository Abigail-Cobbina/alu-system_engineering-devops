cat > 0-the_sky_is_the_limit_not.pp << 'EOF'
# Raises the open file limit for Nginx so it handles heavy load
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
  notify  => Exec['restart-nginx'],
}

exec { 'restart-nginx':
  command     => '/etc/init.d/nginx restart',
  refreshonly => true,
}
EOF
puppet apply 0-the_sky_is_the_limit_not.pp
ab -c 100 -n 2000 localhost/
