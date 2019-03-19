require 'spec_helper'

describe package('postfix'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('pypolicyd-spf') do
  it { should be_installed }
end

describe service('opendkim') do
  it { should be_enabled }
end

describe service('opendmarc') do
  it { should be_enabled }
end

describe port(25) do
  it { should be_listening }
end

describe port(8891) do
  it { should be_listening }
end

describe port(8893) do
  it { should be_listening }
end

describe command('postconf -n') do
  its(:stdout) { should match /home_mailbox = Maildir\// }
  its(:stdout) { should match /mydestination = \$myhostname, localhost\.\$mydomain, localhost/ }
  its(:stdout) { should match /mydomain = localhost/ }
  its(:stdout) { should match /myhostname = host.localhost/ }
  its(:stdout) { should match /mynetworks_style = host/ }
  its(:stdout) { should match /relay_domains = / }
  its(:stdout) { should match /relayhost = 127.0.0.1:10025/ }
end

describe file('/etc/skel/Maildir/new') do
  it { should be_directory }
end

describe file('/etc/skel/Maildir/cur') do
  it { should be_directory }
end

describe file('/etc/skel/Maildir/tmp') do
  it { should be_directory }
end

describe port(10025) do
  it { should be_listening }
end
