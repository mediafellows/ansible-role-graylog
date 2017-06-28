require 'spec_helper'

describe "Graylog" do
  package('elasticsearch') do
    it { should be_installed }
  end

  package('mongodb') do
    it { should be_installed }
  end

  package('graylog-server') do
    it { should be_installed }
  end
end
