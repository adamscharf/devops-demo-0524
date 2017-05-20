require 'spec_helper'

describe ec2('i-0dddcff3a86cd60bd') do
  it { should exist }
  it { should be_running }
  its(:instance_id) { should eq 'i-0dddcff3a86cd60bd' }
  its(:image_id) { should eq 'ami-275ffe31' }
  its(:private_dns_name) { should eq 'ip-10-0-2-59.ec2.internal' }
  its(:public_dns_name) { should eq '' }
  its(:instance_type) { should eq 't2.micro' }
  its(:private_ip_address) { should eq '10.0.2.59' }
  its(:public_ip_address) { should eq '52.70.149.196' }
  it { should have_security_group('MyWebServerSG') }
  it { should belong_to_vpc('ACloudGuruVPC') }
  it { should belong_to_subnet('10.0.2.0 - us-east-1c') }
  it { should have_ebs('vol-032a7997216f41227') }
  it { should have_ebs('vol-029527deb19bab963') }
  it { should have_network_interface('eni-4c970485') }
end

describe ec2('i-065e289a1763f1bf0') do
  it { should exist }
  it { should be_running }
  its(:instance_id) { should eq 'i-065e289a1763f1bf0' }
  its(:image_id) { should eq 'ami-275ffe31' }
  its(:private_dns_name) { should eq 'ip-10-0-1-55.ec2.internal' }
  its(:public_dns_name) { should eq '' }
  its(:instance_type) { should eq 't2.micro' }
  its(:private_ip_address) { should eq '10.0.1.55' }
  its(:public_ip_address) { should eq '54.237.247.222' }
  it { should have_security_group('MyWebServerSG') }
  it { should belong_to_vpc('ACloudGuruVPC') }
  it { should belong_to_subnet('10.0.1.0 - us-east-1a') }
  it { should have_ebs('vol-0a5c00d85ee9342b4') }
  it { should have_ebs('vol-0c2a7bcff49a2fff3') }
  it { should have_network_interface('eni-384c1ce3') }
end
