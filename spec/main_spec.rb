require 'spec_helper'

describe "Graylog" do
  describe package('elasticsearch') do
    it { should be_installed }
  end

  describe package('mongodb') do
    it { should be_installed }
  end

  describe package('graylog-server') do
    it { should be_installed }
  end
end
