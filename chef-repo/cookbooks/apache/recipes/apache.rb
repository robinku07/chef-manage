if node['platform_family']=='rhel'
	apache='httpd'
	apache-service='httpd'
elsif node['platform_family']=='debian'
	apache='apache2'
	apache-service='apache2'
end	
package 'apache2' do
	package_name apache
	notifies :start,'service[apache2]',:immediately
end
service 'apache2' do
	service_name apache-service
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
