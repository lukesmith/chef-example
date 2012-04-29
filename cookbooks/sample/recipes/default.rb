directory "/var/sample_site"

user "deployer" do
  action :create
  password "$1$XVndCU6N$1csnq9gj9My18SQDUcTCU."
  system true
  shell "/bin/zsh"
  supports :manage_home => true
  home "/home/deployer"
end

generate_ssh_keys do
  user_account "deployer"
end

directory "/opt/applications" do
  owner "deployer"
  mode 0755
end

file "/var/sample_site/index.html" do
  content "<h1>Hello world from sample site</h1>"
end

file "#{node[:nginx][:dir]}/sites-available/sample_site" do
  content "server { root /var/sample_site; }"
end

nginx_site "sample_site"
