name 'webserver'
description 'The base role for webservers'
run_list "recipe[apt]",
  "recipe[apt-update]",
  "recipe[build-essential]",
  "recipe[rvm::vagrant]",
  "recipe[rvm::system_install]",
  "recipe[passenger::daemon]"

default_attributes(
  :passenger => {
    :production => {
      :worker_processes => 23,
      :disable_access_log => true,
      :gzip_http_version => '1.1',
      :gzip_comp_level => 6,
      :gzip_vary => 'on',
      :gzip_buffers => '16 8k',
      :gzip_disable => 'MSIE [1-6].(?!.*SV1)',
      :log_format => [
        { :name => 'main',
          :format => [
            '$remote_addr - $remote_user [$time_local] "$request" ',
            '$status $body_bytes_sent "$http_referer" ',
            '"$http_user_agent" "$http_x_forwarded_for"'] },
        { :name => 'g-a',
          :format => [
            '$remote_addr - $remote_user [$time_local] ',
            '"$request" $status $body_bytes_sent ',
            '"$http_referer" "$http_user_agent" ',
            '"__utma=$cookie___utma;__utmb=$cookie___utmb;__utmc=$cookie___utmc;__utmv=$cookie___utmv;__utmz=$cookie_umtz"'] }
      ]
    }
  }
)

