require 'spec_helper'

describe 'default' do
  describe http_get(80, 'localhost', '/') do
    its(:status) { should eq 200 }
    its(:headers) { should include('server' => 'nginx') }
  end

  describe http_get(80, 'localhost', '/error') do
    its(:status) { should eq 404 }
    its(:headers) { should include('server' => 'nginx') }
  end

  describe file('/etc/nginx/conf.d/events/multi_accept.conf') do
    it { should be_file }
    it { should contain('multi_accept on') }
  end
end
