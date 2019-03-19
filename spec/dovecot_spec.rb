require 'spec_helper'

describe package('dovecot'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe port(143) do
  it { should be_listening }
end

describe port(110) do
  it { should be_listening }
end
