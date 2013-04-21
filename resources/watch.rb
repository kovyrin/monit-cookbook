#
# Cookbook Name:: Monit
# Resource:: watch
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

actions :enable, :disable

default_action :enable

attribute :name, :kind_of => String, :name_attribute => true
attribute :pid_file, :kind_of => String
attribute :start_command, :kind_of => String
attribute :stop_command, :kind_of => String
attribute :restart_timeout_count, :kind_of => Integer, :default => 5
attribute :cycle_timeout_count, :kind_of => Integer, :default => 5
