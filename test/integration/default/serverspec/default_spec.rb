require 'spec_helper'

describe 'default' do
  ports = [
    80,
    81
  ]
  ports.each do |port|
    describe http_get(port, 'localhost', '/') do
      its(:status) { should eq 200 }
      its(:headers) { should include('server' => 'nginx') }
    end

    describe http_get(port, 'localhost', '/error') do
      its(:status) { should eq 404 }
      its(:headers) { should include('server' => 'nginx') }
    end
  end
end
