package "monit"

if platform?("ubuntu")
  cookbook_file "/etc/default/monit" do
    source "monit.default"
    owner "root"
    group "root"
    mode 0644
  end
end

service "monit"

directory(node[:monit][:config_d_dir]) do
  owner  'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end

template(node[:monit][:config_file]) do
  owner "root"
  group "root"
  mode 0700
  source 'monitrc.erb'
  notifies :restart, resources(:service => "monit"), :delayed
end

service "monit" do
  action [:enable, :start]
  supports :restart => true
end
