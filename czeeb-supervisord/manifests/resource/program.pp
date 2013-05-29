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
  $ensure                  = 'enable',
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
  $stopsignial             = undef,
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
    fail("You must include supervisord base class before using supervisord defined resources.")
  }

  #unless ${name} {
  #  fail("No name set for supervisord::resource::program")
  #}

  #unless $command {
  #  fail("Command must be set")
  #}

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { "/etc/supervisor/conf.d/${name}.conf":
    ensure => file,
    content => template('supervisord/program.conf.erb'),
  } ~> Exec['update-config']

}