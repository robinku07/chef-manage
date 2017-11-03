if node['platform_family']=='rhel'
	apache='httpd'
	apache_service='httpd'
	gowner='apache'
elsif node['platform_family']=='debian'
	apache='apache2'
	apache_service='apache2'
	gowner='www-data'
end	
package 'apache2' do
	package_name apache
	notifies :start,'service[apache2]',:immediately
end
service 'apache2' do
	service_name apache_service
	action :nothing
end
file 'index_file' do
	path '/var/www/html/index.html'
	content '<H1>Welcome in Hello World?</H1>'
	mode '0644'
	owner 'root'
	group gowner
	not_if { ::File.exist?('/var/www/html/index.html') }
	notifies :reload, 'service[apache2]', :immediately
end
