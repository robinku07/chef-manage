file '/etc/motd' do
	content 'Welcome in the world of Security!!!!!!!'
	only_if { ::File.exist?('/etc/motd') }
end
