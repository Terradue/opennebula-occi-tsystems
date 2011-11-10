spec = Gem::Specification.new do |s|
  s.name = 'occi-tsystems'
  s.version = '1.0'
  s.summary = "Terradue OpenNebula <-> t-systems OCCI bridge"
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb']
  s.description = %{ bridge driver between OpenNebula (http://opennebula.org/) and the cloud provider t-systems (http://www.t-systems.com/) exposing OCCI compliant REST APIs.}
  s.autorequire = 'builder'
  s.rdoc_options << '--title' <<  'Terradue OpenNebula <-> t-systems OCCI bridge'
  s.author = "Simone Tripodi"
  s.email = "simone.tripodi@terradue.com"
  s.homepage = "https://github.com/Terradue/opennebula-occi-tsystems"
end
