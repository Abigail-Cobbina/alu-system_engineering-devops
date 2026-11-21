# Fix the incorrect PHP file extension in the WordPress settings file

exec { 'fix-wordpress-locale-typo':
  command => "/bin/sed -i 's/class-wp-locale\\.phpp/class-wp-locale.php/g' /var/www/html/wp-settings.php",
  path    => ['/bin', '/usr/bin'],
  onlyif  => '/bin/grep -qF class-wp-locale.phpp /var/www/html/wp-settings.php',
}
