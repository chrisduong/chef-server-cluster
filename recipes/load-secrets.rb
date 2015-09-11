#
# Cookbook Name:: chef-server-cluster
# Recipes:: load-secrets
#
# Author: Joshua Timberman <joshua@chef.io>
# Copyright (C) 2014, Chef Software, Inc. <legal@chef.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This recipe has bugs and isn't used yet, but I wanted to make it
# available as a starting point.
#
ChefHelpers.secret_files.each do |secret|
  secret_id = "#{secret.gsub(/\\.[a-z]+/, '_')}_#{node.chef_environment}"
  secret_content = chef_vault_item('bootstrap-secrets', secret_id)['data']

  file "/etc/opscode/#{secret}" do
    content secret_content
  end
end
