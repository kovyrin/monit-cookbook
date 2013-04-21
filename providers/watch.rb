#
# Cookbook Name:: Monit
# Provider:: watch
#
# Copyright 2011, gotryiton
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

action :enable do
  pid_file = new_resource.pid_file || "/var/run/#{new_resource.name}.pid"
  start_command = new_resource.start_command || "/etc/init.d/#{new_resource.name} start"
  stop_command = new_resource.stop_command || "/etc/init.d/#{new_resource.name} stop"

  template "/etc/monit/conf.d/#{new_resource.name}.conf" do
    owner "root"
    group "root"
    mode "644"
    variables name: new_resource.name,
      pid_file: pid_file,
      start_command: start_command,
      stop_command: stop_command,
      restart_timeout_count: new_resource.restart_timeout_count,
      cycle_timeout_count: new_resource.cycle_timeout_count

    source "monit_resource.conf.erb"
    cookbook "monit"
    notifies :restart, "service[monit]"
  end
end

action :disable do
  template "/etc/monit/conf.d/#{new_resource.name}.conf" do
    action :delete
    notifies :restart, "service[monit]"
  end
end
