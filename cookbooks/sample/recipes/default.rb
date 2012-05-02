include_recipe "user"

directory "/var/sample_site"

gem_package "ruby-shadow" do
  action :install
end

user_account 'deployer' do
  comment   'Deployment user'
  password  '$1$XVndCU6N$1csnq9gj9My18SQDUcTCU.'
end

bash "updating ssh_known_hosts" do
  code "ssh-keyscan -H github.com > /etc/ssh/ssh_known_hosts"
end

directory "/opt/applications" do
  owner "deployer"
  mode 0755
end

file "/var/sample_site/index.html" do
  content "<h1>Hello world from sample site</h1>"
end

#file "#{node[:nginx][:dir]}/sites-available/sample_site" do
#  content "server { root /opt/applications/pubbr/current/public/; }"
#end

#nginx_site "sample_site"
