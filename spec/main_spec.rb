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

  describe port(3000) do
    it { should be_listening.with('tcp') }
  end
end
