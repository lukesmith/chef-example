directory "/var/sample_site"

file "/var/sample_site/index.html" do
  content "<h1>Hello world from sample site</h1>"
end

file "#{node[:nginx][:dir]}/sites-available/sample_site" do
  content "server { root /var/sample_site; }"
end

nginx_site "sample_site"
