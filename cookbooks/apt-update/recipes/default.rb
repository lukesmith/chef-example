#
# Cookbook Name:: apt-update
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

e = execute "apt-get update" do
    action :nothing
end

e.run_action(:run)
