#
# Cookbook Name:: htop
# Attributes:: default
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

default["htop"]["packages"] = %w(
  htop
  nmon
)

case node["platform_family"]
when "suse"
  repo = case node["platform_version"]
  when /\A13\.\d+\z/
    "openSUSE_#{node["platform_version"]}"
  when /\A42\.\d+\z/
    "openSUSE_Leap_#{node["platform_version"]}"
  when /\A\d{8}\z/
    "openSUSE_Factory"
  else
    raise "Unsupported SUSE version"
  end

  default["htop"]["zypper"]["enabled"] = true
  default["htop"]["zypper"]["alias"] = "network-utilities"
  default["htop"]["zypper"]["title"] = "Network Utilities"
  default["htop"]["zypper"]["repo"] = "http://download.opensuse.org/repositories/network:/utilities/#{repo}/"
  default["htop"]["zypper"]["key"] = "#{node["htop"]["zypper"]["repo"]}repodata/repomd.xml.key"
end
