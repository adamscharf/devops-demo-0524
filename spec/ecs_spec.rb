describe ecs_cluster('default') do
  it { should exist }
  it { should be_active }
  its(:registered_container_instances_count) { should eq 1 }
end
