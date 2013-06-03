# define: supervisord::resource::program
#
# This definition creates a program config file
#
# Parameters:
#
#
# Actions:
#
# Requires:
#
# Sample Usage:
# supervisord::resource::program { 'helloworld':
#   ensure => present,
# }

define supervisord::resource::program (
  $ensure                  = 'present',
  $command                 = undef,
  $process_name            = undef,
  $numprocs                = undef,
  $numprocs_start          = undef,
  $priority                = undef,
  $autostart               = undef,
  $autorestart             = undef,
  $startsecs               = undef,
  $startretries            = undef,
  $exitcodes               = undef,
  $stopsignal              = undef,
  $stopwaitsecs            = undef,
  $stopasgroup             = undef,
  $killasgroup             = undef,
  $user                    = undef,
  $redirect_stderr         = undef,
  $stdout_logfile          = undef,
  $stdout_logfile_maxbytes = undef,
  $stdout_logfile_backups  = undef,
  $stdout_capture_maxbytes = undef,
  $stdout_events_enabled   = undef,
  $stderr_logfile          = undef,
  $stderr_logfile_maxbytes = undef,
  $stderr_logfile_backups  = undef,
  $stderr_capture_maxbytes = undef,
  $stderr_events_enabled   = undef,
  $environment             = undef,
  $directory               = undef,
  $umask                   = undef,
  $serverurl               = undef
) {

  if ! defined(Class['supervisord']) {
    fail('You must include supervisord base class before using supervisord defined resources.')
  }

  if ! $name {
    fail('No name set for supervisord::resource::program')
  }

  if ! $command {
    fail('Command must be set for supervisord::resource::program')
  }

  $filename = regsubst($name, ' ', '_', 'G')

  file { "/etc/supervisor/conf.d/${filename}.conf":
    ensure  => $ensure,
    content => template('supervisord/program.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => [
      Package['supervisor'],
      File['/etc/supervisor/conf.d/'],
    ],
  } ~> Exec['update-config']

}
