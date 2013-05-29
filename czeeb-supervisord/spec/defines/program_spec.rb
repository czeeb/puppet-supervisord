require 'spec_helper'

describe 'supervisord::resource::program', :type => :define do
  let :pre_condition do
    'include supervisord'
  end

  describe "creation with name/title set" do
    let :title do
      'testname'
    end

    it 'should include class supervisord' do 
      should include_class('supervisord')
    end 

    it 'should create /etc/supervisor/conf.d/testname.conf' do 
      should contain_file('/etc/supervisor/conf.d/testname.conf')
    end

    it 'should create /etc/supervisor/conf.d/testname.conf with config file header' do
      should contain_file('/etc/supervisor/conf.d/testname.conf') \
        .with_contents(/^\[program:testname\]$/)
    end
  end

#  describe 'required values with no values set'
#    let :title do
#      'testname'
#    end

#    it 'should throw an error if command is not set' do
#      #raise_error(Puppet::Error, /command must be set/)
#    end
#  end

#  describe 'default values' do
#    let :title do
#      'testname'
#    end
#
#    let :params { { } }
#
#    it 'should not set process_name' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^process_name=/)
#    end
#
#    it 'should not set numprocs' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^numprocs=/)
#    end
#
#    it 'should not set numprocs_start' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^numprocs_start=/)
#    end
#
#    it 'should not set priority' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^priority=/)
#    end
#
#    it 'should not set autostart' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^autostart=/)
#    end
#
#    it 'should not set autorestart' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^autorestart=/)
#    end
#
#    it 'should not set startsecs' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^startsecs=/)
#    end
#
#    it 'should not set startretries' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^startretries=/)
#    end

#    it 'should not set exitcodes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^exitcodes=/)
#    end

#    it 'should not set stopsignal' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stopsignal=/)
#    end

#    it 'should not set stopwaitsecs' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stopwaitsecs=/)
#    end

#    it 'should not set stopasgroup' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stopasgroup=/)
#    end

#    it 'should not set killasgroup' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^killasgroup=/)
#    end

#    it 'should not set user' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^user=/)
#    end

#    it 'should not set redirect_stderr' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^redirect_stderr=/)
#    end

#    it 'should not set stderr_logfile' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stderr_logfile=/)
#    end

#    it 'should not set stderr_logfile_maxbytes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stderr_logfile_maxbytes=/)
#    end

#    it 'should not set stderr_logfile_backups' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stderr_logfile_backups=/)
#    end

#    it 'should not set stderr_capture_maxbytes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stderr_capture_maxbytes=/)
#    end
#      
#    it 'should not set stderr_events_enabled' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stderr_events_enabled=/)
#    end

#    it 'should not set redirect_stdout' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^redirect_stdout=/)
#    end

#    it 'should not set stdout_logfile' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stdout_logfile=/)
#    end

#    it 'should not set stdout_logfile_maxbytes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stdout_logfile_maxbytes=/)
#    end

#    it 'should not set stdout_logfile_backups' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stdout_logfile_backups=/)
#    end

#    it 'should not set stdout_capture_maxbytes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stdout_capture_maxbytes=/)
#    end
#      
#    it 'should not set stdout_events_enabled' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^stdout_events_enabled=/)
#    end

#    it 'should not set environment' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^environment=/)
#    end

#    it 'should not set serverurl' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .without_contents(/^serverurl=/)
#    end
#  end

#  describe 'setting value' do
#    let :title do
#      'testname'
#    end

#    let :params do
#      {
#        :command                 => '/bin/cat',
#	:process_name            => 'test_name',
#	:numprocs                => 5,
#	:numprocs_start          => 1,
#	:priority                => 900,
#	:autostart               => 'false',
#	:autorestart             => 'false',
#	:startsecs               => 5,
#	:startretries            => 10,
#	:exitcodes               => '0,5',
#	:stopsignal              => 'USR1',
#	:stopwaitsecs            => 20,
#	:stopasgroup             => 'true',
#	:killasgroup             => 'true',
#	:user                    => 'randomuser',
#	:redirect_stderr         => 'true',
#	:stdout_logfile          => '/tmp/stdout.log',
#	:stdout_logfile_maxbytes => '10MB',
#	:stdout_logfile_backups  => 5,
#	:stdout_capture_maxbytes => '10KB',
#	:stdout_events_enabled   => 1,
#	:stderr_logfile          => '/tmp/stdout.log',
#	:stderr_logfile_maxbytes => '10MB',
#	:stderr_logfile_backups  => 5,
#	:stderr_capture_maxbytes => '10KB',
#	:stderr_events_enabled   => 1,
#	:environment             => 'E=mc2',
#	:directory               => '/tmp',
#	:umask                   => '777',
#	:serverurl               => 'someurl'
#      }
#    end

#    it 'should set command' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^command=\/bin\/cat$/)
#    end

#    it 'should set process_name' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^process_name=test_name$/)
#    end

#    it 'should set numprocs' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^numprocs=5$/)
#    end

#    it 'should set numprocs_start' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^numprocs_start=1$/)
#    end

#    it 'should set priority' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^priority=900$/)
#    end

#    it 'should set autostart' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^autostart=false$/)
#    end

#    it 'should set autorestart' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^autorestart=false$/)
#    end

#    it 'should set startsecs' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^startsecs=5$/)
#    end

#    it 'should set startretries' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^startretries=10$/)
#    end

#    it 'should set exitcodes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^exitcodes=0,5$/)
#    end

#    it 'should set stopsignal' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stopsignal=USR1$/)
#    end

#    it 'should set stopwaitsecs' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stopwaitsecs=20$/)
#    end

#    it 'should set stopasgroup' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stopasgroup=true$/)
#    end

#    it 'should set killasgroup' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^killasgroup=true$/)
#    end

#    it 'should set user' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^user=randomuser$/)
#    end

#    it 'should set redirect_stderr' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^redirect_stderr=true$/)
#    end

#    it 'should set stderr_logfile' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stderr_logfile=\/tmp\/stdout.log$/)
#    end

#    it 'should set stderr_logfile_maxbytes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stderr_logfile_maxbytes=10MB$/)
#    end

#    it 'should set stderr_logfile_backups' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stderr_logfile_backups=5$/)
#    end

#    it 'should set stderr_capture_maxbytes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stderr_capture_maxbytes=10KB$/)
#    end
#      
#    it 'should set stderr_events_enabled' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stderr_events_enabled=1$/)
#    end

#    it 'should set redirect_stdout' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^redirect_stdout=true$/)
#    end

#    it 'should set stdout_logfile' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stdout_logfile=\/tmp\/stdout.log$/)
#    end

#    it 'should set stdout_logfile_maxbytes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stdout_logfile_maxbytes=10MB$/)
#    end

#    it 'should set stdout_logfile_backups' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stdout_logfile_backups=5$/)
#    end

#    it 'should set stdout_capture_maxbytes' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stdout_capture_maxbytes=10KB$/)
#    end
#      
#    it 'should set stdout_events_enabled' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^stdout_events_enabled=1$/)
#    end

#    it 'should set environment' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^environment=E=mc2$/)
#    end

#    it 'should set serverurl' do
#      should contain_file('/etc/supervisor/conf.d/testname.conf') \
#        .with_contents(/^serverurl=someurl$/)
#    end
end
