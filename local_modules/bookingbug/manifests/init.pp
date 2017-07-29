class bookingbug {

  vcsrepo { '/home/ed/bookingbug':
    ensure => 'present',
    provider => 'git',
    source => 'git@github.com:Glenn/bookingbug.git',
  }

  $packages = [
    'libmagickwand-dev',
    'imagemagick',
    'libmysqlclient-dev',
  ]

  package {
    $packages: ensure => 'installed',
  }

}
