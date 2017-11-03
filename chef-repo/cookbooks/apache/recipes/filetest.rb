file '/var/www/html/index.html' do
	mode '0666'
	owner 'root'	
end
service 'apache2' do
	service_name 'httpd'
	subscribes :reload, 'file[/var/www/html/index.html]', :immediately
end
#execute 'sysstat' do
#	command 'yum install sysstat -y'
#end
package 'sysstat' do
	action :purge
end
package %w( ) do
	action :upgrade
end
