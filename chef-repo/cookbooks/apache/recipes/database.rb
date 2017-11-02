if node['platform']=='centos'
	package='mariadb-server'
elsif node['platform']=='amazon'
	package='mysql-server'
end
package 'mysql' do
	package_name package
	notifies :start, 'service[mysqld]', :immediately
	notifies :enable, 'service[mysqld]', :immediately
end
service 'mysqld' do
	service_name 'mariadb'
	action :nothing
end
