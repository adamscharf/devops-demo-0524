package 'httpd'

service 'httpd' do
  action %i[start enable]
end

file '/var/www/html/index.html' do
  content 'Hello World'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
