package 'apache2' do
	package_name 'httpd'
	notifies :start,'service[apache2]',:immediately
end
service 'apache2' do
	service_name 'httpd'
	action :nothing
end
file 'index_file' do
	path '/var/www/html/index.html'
	content '<H1>Welcome in Hello World?</H1>'
	mode '0644'
	owner 'root'
	group 'apache'
	not_if { ::File.exist?('/var/www/html/index.html') }
	notifies :reload, 'service[apache2]', :immediately
end
