describe package('docker') do
  it { should be_installed }
end

describe service('docker') do
  it { should be_enabled }
  it { should be_running }
end

describe package('ecs-init') do
  it { should be_installed }
end

describe service('ecs') do
  # Due to ecs being an upstart service, there is no clear path to check if it
  # has been enabled. The service doesn't get registered in chkconfig thus you
  # have you reboot the box and manually verify. This approach is not practical
  # with test kitchen.
  # it { should be_enabled }
  it { should be_running }
end

describe command('curl -s http://localhost:51678/v1/metadata') do
  its(:exit_status) { should eq 0 }
  its(:stdout) do
    should include('"Cluster":"default')
  end
end

describe package 'httpd' do
  it { should be_installed }
end

describe service 'httpd' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe file '/var/www/html/index.html' do
  its('content') { should match 'Hello World' }
end
