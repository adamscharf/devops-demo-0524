require 'spec_helper'

describe ec2('i-0b409b3763a54ad7d') do
  it { should exist }
  it { should be_running }
  its(:instance_id) { should eq 'i-0b409b3763a54ad7d' }
  its(:image_id) { should eq 'ami-275ffe31' }
  its(:private_dns_name) { should eq 'ip-172-31-55-157.ec2.internal' }
  its(:public_dns_name) do
    should eq 'ec2-54-224-132-122.compute-1.amazonaws.com'
  end
  its(:instance_type) { should eq 't2.micro' }
  its(:private_ip_address) { should eq '172.31.55.157' }
  its(:public_ip_address) { should eq '54.224.132.122' }
  it { should have_security_group('Web-DMZ') }
  it { should belong_to_vpc('DefaultVPC') }
  it { should belong_to_subnet('us-east-1c') }
  it { should have_ebs('vol-092befe03f3d47e15') }
  it { should have_network_interface('eni-b6ff947f') }
end
