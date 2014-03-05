#
# Cookbook Name:: joomla
# Recipe:: default
#
# Copyright (C) 2014 Alex Crawford
# 
# All rights reserved - Do Not Redistribute
#

# ----------------------------------- #
# => Apache                           #
# ----------------------------------- #

include_recipe "apache2"

web_app "joomla.dev1.cagehost.com" do
  server_name "joomla.dev1.cagehost.com"
  docroot "/var/www/joomla"
end

# ----------------------------------- #
# => Database                         #
# ----------------------------------- #

include_recipe "mysql::server"
include_recipe "database::mysql"

mysql_database 'joomla' do
  connection ({
    :host => "127.0.0.1",
    :username => 'root',
    :password => node['mysql']['server_root_password']
  })
  action :drop
end