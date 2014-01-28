# encoding: UTF-8
#

require 'chefspec'
require 'chefspec/berkshelf'

LOG_LEVEL = :fatal
OPENSUSE_OPTS = {
  platform: 'opensuse',
  version: '12.3',
  log_level: LOG_LEVEL
}
REDHAT_OPTS = {
  platform: 'redhat',
  version: '6.3',
  log_level: LOG_LEVEL
}
UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '12.04',
  log_level: LOG_LEVEL
}

shared_context 'identity_stubs' do
  before do
    ::Chef::Recipe.any_instance.stub(:address_for)
      .with('lo')
      .and_return('127.0.1.1')
    ::Chef::Recipe.any_instance.stub(:memcached_servers).and_return []
    ::Chef::Recipe.any_instance.stub(:get_password)
      .with('db', anything)
      .and_return('')
    ::Chef::Recipe.any_instance.stub(:get_password)
      .with('user', anything)
      .and_return('')
    ::Chef::Recipe.any_instance.stub(:get_password)
      .with('user', 'user1')
      .and_return('secret1')
    ::Chef::Recipe.any_instance.stub(:secret)
      .with('secrets', 'openstack_identity_bootstrap_token')
      .and_return('bootstrap-token')
  end
end
