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

    it 'should be create /etc/supervisor/conf.d/testname.conf' do 
      should contain_file('/etc/supervisor/conf.d/testname.conf')
    end
  end
end
