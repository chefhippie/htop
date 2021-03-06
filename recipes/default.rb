#
# Cookbook Name:: htop
# Recipe:: default
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
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

case node["platform_family"]
when "suse"
  include_recipe "zypper"

  zypper_repository node["htop"]["zypper"]["alias"] do
    uri node["htop"]["zypper"]["repo"]
    key node["htop"]["zypper"]["key"]
    title node["htop"]["zypper"]["title"]

    action [:add, :refresh]

    only_if do
      node["htop"]["zypper"]["enabled"]
    end
  end
end

node["htop"]["packages"].each do |name|
  package name do
    action :install
  end
end
