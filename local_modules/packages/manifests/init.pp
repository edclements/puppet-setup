class packages {

  $packages = [
    'sudo',
    'git',
    'vim',
    'tmux',
    'vifm',
  ]

  package {
    $packages: ensure => 'installed',
  }

}
