require 'spec_helper'

describe 'supervisord', :type => 'class' do

  context "creation with no parameters" do
    it 'should create class supervisord' do
      should create_class('supervisord') 
    end

    it 'should contain package supervisor' do 
      should contain_package('supervisor').with( { 'name' => 'supervisor' } )
    end

    it 'should contain service supervisor' do
      should contain_service('supervisor').with( { 'name' => 'supervisor' } )
    end

    it 'should have directory /etc/supervisor/conf.d' do
      should contain_file('/etc/supervisor/conf.d')
    end

    it 'should contain file /etc/supervisor/supervisord.conf with logfile=/var/log/supervisor/supervisord.log' do
      should contain_file('/etc/supervisor/supervisord.conf') \
        .with_content(/^logfile=\/var\/log\/supervisor\/supervisord.log$/)
    end

    it 'should contain file /etc/supervisor/supervisord.conf with pidfile=/var/run/supervisord.pid' do
      should contain_file('/etc/supervisor/supervisord.conf') \
        .with_content(/^pidfile=\/var\/run\/supervisord.pid$/)
    end

    it 'should contain file /etc/supervisor/supervisord.conf with childlogdir=/var/log/supervisor' do
      should contain_file('/etc/supervisor/supervisord.conf') \
        .with_content(/^childlogdir=\/var\/log\/supervisor$/)
    end 

    it 'should contain file /etc/supervisor/supervisord.conf with serverurl=unix:///var/run/supervisor.sock' do
      should contain_file('/etc/supervisor/supervisord.conf') \
        .with_content(/^serverurl=unix:\/\/\/var\/run\/supervisor.sock$/)
    end

    it 'should contain file /etc/supervisor/supervisord.conf with files=/etc/supervisor/conf.d/*.conf' do
      should contain_file('/etc/supervisor/supervisord.conf') \
        .with_content(/^files=\/etc\/supervisor\/conf.d\/\*\.conf$/)
    end
    
  end

  context "creation with parameters overriding defaults" do
    let :params do 
      {
        :logfile       => '/tmp/supervisord.log',
        :pidfile       => '/tmp/supervisor.pid',
        :childlogdir   => '/tmp',
        :serverurl     => 'unix:///var/run/alternative-supervisor.sock',
        :include_files => ['foo','bar','/etc/supervisor/conf.d/*.conf']
      }
    end

    it 'should contain file /etc/supervisor/supervisord.conf with logfile=/tmp/supervisord.log' do 
      should contain_file('/etc/supervisor/supervisord.conf') \
        .with_content(/^logfile=\/tmp\/supervisord.log$/)
    end

    it 'should contain file /etc/supervisor/supervisord.conf with pidfile=/tmp/supervisor.pid' do
      should contain_file('/etc/supervisor/supervisord.conf') \
        .with_content(/^pidfile=\/tmp\/supervisor.pid$/)
    end

    it 'should contain file /etc/supervisor/supervisord.conf with childlogdir=/tmp' do
      should contain_file('/etc/supervisor/supervisord.conf') \
        .with_content(/^childlogdir=\/tmp$/)
    end

    it 'should contain file /etc/supervisor/supervisord.conf with serverurl=unix:///var/run/alternative-supervisor.sock' do
      should contain_file('/etc/supervisor/supervisord.conf') \
        .with_content(/^serverurl=unix:\/\/\/var\/run\/alternative-supervisor.sock$/)
    end



      [
        'foo',
        'bar',
        '\/etc\/supervisor\/conf\.d\/\*\.conf'
      ].each do |include_file|
        it "should contain file /etc/supervisor/supervisord.conf with files=#{include_file}" do
          should contain_file('/etc/supervisor/supervisord.conf') \
            .with_content(/^files=#{include_file}$/)
        end
      end
  end
end
