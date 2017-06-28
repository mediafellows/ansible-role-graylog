require 'spec_helper'

describe "Graylog setup" do
  describe package('elasticsearch') do
    it { should be_installed }
  end

  describe package('mongodb') do
    it { should be_installed }
  end

  describe package('graylog-server') do
    it { should be_installed }
  end

  describe service('elasticsearch') do
    it { should be_running }
    it { should be_enabled }
  end

  describe service('mongodb') do
    it { should be_running }
    it { should be_enabled }
  end

  describe service('graylog-server') do
    it { should be_running }
    it { should be_enabled }
  end

  describe file('/etc/graylog/server/server.conf') do
    it { should be_file }
    its(:content) { should include('rest_listen_uri = http://0.0.0.0:9000/api/') }
    its(:content) { should include('web_listen_uri = http://0.0.0.0:9000/') }
    its(:content) { should include('plugin_dir = /usr/share/graylog-server/plugin') }
  end

  describe port(3000) do
#    it { should be_listening.with('tcp') }
  end
end
