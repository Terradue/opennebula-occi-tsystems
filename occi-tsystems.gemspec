##############################################################################
#  Copyright 2011 Terradue srl
#  
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#  
#      http://www.apache.org/licenses/LICENSE-2.0
#  
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
##############################################################################

spec = Gem::Specification.new do |s|
  s.name = 'occi-tsystems'
  s.version = '1.0'
  s.summary = "Terradue OpenNebula <-> t-systems OCCI bridge"
  s.files = Dir['src/**/*.rb'] + Dir['test/**/*.rb']
  s.description = %{ bridge driver between OpenNebula (http://opennebula.org/) and the cloud provider t-systems (http://www.t-systems.com/) exposing OCCI compliant REST APIs.}
  s.rdoc_options << '--title' <<  'Terradue OpenNebula <-> t-systems OCCI bridge'
  s.author = "Simone Tripodi"
  s.email = "simone.tripodi@terradue.com"
  s.homepage = "https://github.com/Terradue/opennebula-occi-tsystems"
  s.add_dependency("opennebula-occi", ">= 2.2")
  s.add_dependency("rest-client", "~> 1.6.7")
  s.add_dependency("libxml-ruby", ">= 0.8.3")
end
