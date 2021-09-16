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
    its(:content) { should include('elasticsearch_hosts = http://127.0.0.1:9200') }
    its(:content) { should include('http_bind_address = 127.0.0.1:9000') }
    its(:content) { should include('plugin_dir = /usr/share/graylog-server/plugin') }
  end

  describe port(9000) do
    # Still works but serverspec only filters for ipv4 ports but Graylog opens 9000 for all IP versions (*:9000)
    # it { should be_listening.with('tcp') }
  end
end
