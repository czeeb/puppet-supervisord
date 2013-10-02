# define: supervisord::resource::program
#
# This definition creates a program config file
#
# Parameters:
# $ensure                  - 
# $command                 - REQUIRED - command to execute
# $process_name            - The name for each instance started with this
#                            config
# $numprocs                - The number of instances to start with the command
# $numprocs_start          - The number to begin incrementing from for
#                            numprocs
# $priority                - The priority to set this config at
# $autostart               - Sets if program should start when supervisor
#                            is started
# $autorestart             - Behaviour for restarting program when it exits
# $startsecs               - Number of seconds program must run to be
#                            considered successful 
# $startretries            - Number of restart retries before program is set
#                            to a fatal state 
# $exitcodes               - List of expected exit codes (non-error) 
# $stopsignal              - Signal to send program when stop is requested 
# $stopwaitsecs            - Number of seconds to wait for the OS to return
#                            a SIGCHILD to supervisord after program has sent
#                            a stop signal 
# $stopasgroup             - Set if supervisor sends a stop signal to entire
#                            group. 
# $killasgroup             - Set if SIGKILL sent to entire process group
# $user                    - The user the program runs as 
# $redirect_stderr         - If true cause the process' stderr output to be
#                            sent back to supervisor on its stdout file
#                            descriptor 
# $stdout_logfile          - 
# $stdout_logfile_maxbytes - 
# $stdout_logfile_backups  -
# $stdout_capture_maxbytes - 
# $stdout_events_enabled   - 
# $stderr_logfile          - 
# $stderr_logfile_maxbytes - 
# $stderr_logfile_backups  - 
# $stderr_capture_maxbytes - 
# $stderr_events_enabled   -
# $environment             -  
# $directory               -  
# $umask                   - 
# $serverurl               - 
#
# Actions:
# - Installs supervisor program config files
#
# Requires:
# - The supervisord class
#
# Sample Usage:
# supervisord::resource::program { 'helloworld':
#   ensure  => present,
#   command => '/bin/cat',
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
