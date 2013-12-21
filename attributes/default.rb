#
# Cookbook Name:: htop
# Attributes:: default
#
# Copyright 2013, Thomas Boerger
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

default["htop"]["packages"] = %w(
  htop
  nmon
)

default["htop"]["zypper"]["title"] = "network-utilities"
default["htop"]["zypper"]["title"] = "Network Utilities"
default["htop"]["zypper"]["repo"] = "http://download.opensuse.org/repositories/network:/utilities/openSUSE_#{node["platform_version"] == "12.1" ? "12.3" : node["platform_version"]}/"
default["htop"]["zypper"]["key"] = "#{node["htop"]["zypper"]["repo"]}repodata/repomd.xml.key"
