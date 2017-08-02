#
# Cookbook Name:: copperegg
# Recipe:: default
#
# Copyright 2013-2016 IDERA
# License:: MIT License
#

is_windows = (node['platform_family'] == 'windows')

raise "Add a ['copperegg']['apikey'] attribute to configure this node's Collector." if node['copperegg'] && node['copperegg']['apikey'].to_s.empty?


apikey = node['copperegg']['apikey']
copperegg_url = node['copperegg']['url']

chef_server_tags = []

chef_server_tags.push(node['chef_environment']) if node['copperegg']['include_env_astag']

# Add any chef roles to the list
node['roles'].each do |role|
  chef_server_tags.push(role)
end if node['copperegg']['include_roles_astags']

node['tags'].each do |tag|
  chef_server_tags.push(tag)
end if node['copperegg']['include_node_tags']

node.override['copperegg']['alltags'] = node['copperegg']['tags'] + chef_server_tags

Chef::Log.warn('Setting UUID to FQDN:\n')
node.override['copperegg']['fqdn'] = node['fqdn'] if node['copperegg']['use_fqdn']

if is_windows
  include_recipe 'copperegg::_windows-collector'
else
  include_recipe 'copperegg::_linux-collector'
end

include_recipe node['copperegg']['uninstall_collector'] ? 'copperegg::_uninstall' : 'copperegg::_install'
