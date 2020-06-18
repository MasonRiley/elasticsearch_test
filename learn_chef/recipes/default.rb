#
# Cookbook:: learn_chef
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# name "java"
# description "Install Oracle Java"
# default_attributes(
#   "java" => {
#     "install_flavor" => "oracle",
#     "jdk_version" => "7",
#     "oracle" => {
#       "accept_oracle_download_terms" => true
#     }
#   }
# )
# run_list(
#   "recipe[java]"
)

elasticsearch_user 'elasticsearch'

elasticsearch_install 'my_es_installation' do
    type 'package' # type of install
    version '7.4.2'
    action :install # could be :remove as well
end

elasticsearch_configure 'elasticsearch' do
configuration ({
    'network.host' => '0.0.0.0',
    'http.port' => 9200,
  })
end

elasticsearch_service 'elasticsearch'