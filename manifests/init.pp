# == Class: supervisord
#
# A module to manage supervisord and the services it runs.
#
# === Parameters
# [*version*]
# The package version to install
#
# [*enable*]
# Should the service be enabled at boot time?
#
# [*start*]
# Should the service be started by Puppet
#
# === Authors
#
# Chris Zeeb <chris.zeeb@gmail.com>
#
# === Copyright
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
class supervisord (
  $version       = 'present',
  $enable        = true,
  $start         = true,
  $logfile       = '/var/log/supervisor/supervisord.log',
  $pidfile       = '/var/run/supervisord.pid',
  $childlogdir   = '/var/log/supervisor',
  $serverurl     = 'unix:///var/run/supervisor.sock',
  $include_files = ['/etc/supervisor/conf.d/*.conf']
) {
  class{'supervisord::install': } ->
  class{'supervisord::config': } ~>
  class{'supervisord::service': } ->
  Class['supervisord']
}
