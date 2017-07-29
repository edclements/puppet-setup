class users {

  group { 'ed':
    ensure => 'present',
    gid => 1050
  }
  user { 'ed':
    ensure => 'present',
    shell => '/bin/bash',
    uid => 1050,
    gid => 'ed',
    groups => ['wheel','audio','power'],
    home => '/home/ed',
    managehome => true
  }
  file { '/home/ed/src':
    ensure => 'directory'
  }

  vcsrepo { '/home/ed/src/vimfiles':
    ensure => 'present',
    provider => 'git',
    source => 'git://github.com/edclements/vimfiles.git',
  }

  file { '/home/ed/.vim':
    ensure => 'link',
    target => '/home/ed/src/vimfiles',
    force => true,
    require => Vcsrepo['/home/ed/src/vimfiles'],
  }

  file { '/home/ed/.vimrc':
    ensure => 'link',
    target => '/home/ed/src/vimfiles/vimrc',
    require => Vcsrepo['/home/ed/src/vimfiles'],
  }

  file { '/home/ed/.gitconfig':
    path => '/home/ed/.gitconfig',
    content => template('users/gitconfig.erb'),
  }

}
