hiera_include('classes')

$override_options = {
  'mysqld'         => {
    'bind-address' => '0.0.0.0',
  }
}

class { 'mysqlproxy':
  install_version => 'mysql-proxy-0.8.5-linux-glibc2.3-x86-64bit',
  address         => '0.0.0.0:3307',
  #  luascript       => 'mc.lua',
  options         => '--log-file=/tmp/proxy.log --log-level=info',
  backends        => ['localhost:3306']
}

class { '::mysql::server':
  root_password           => 'crappy_password',
  remove_default_accounts => true,
  override_options        => $override_options
}


mysql::db { 'testdb':
  user     => 'myuser',
  password => 'mypass',
  host     => '%',
  grant    => ['SELECT', 'UPDATE'],
}
