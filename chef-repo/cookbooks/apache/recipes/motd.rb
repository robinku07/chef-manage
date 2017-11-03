nodename=node['hostname']
file '/etc/motd' do
	content "Welcome in the world of Security!!!!!!! #{nodename}"
	only_if { ::File.exist?('/etc/motd') }
end
