title 'ssh'

include_controls 'ssh-baseline' do 
  skip_control 'ssh-10'
  skip_control 'ssh-11'
  skip_control 'ssh-14'
  skip_control 'ssh-15'
  skip_control 'sshd-40'
end

control 'sshd version' do
  impact 1.0
  title 'Check SSHD Version'
  desc 'Only SSHD version 2 should be enabled'
  describe sshd_config do
    its('Protocol') { should cmp 2 }
  end
end

control 'sshd Permit Root Login' do
  impact 1.0
  title 'Root login should NOT be permitted'
  desc 'Root login should NOT be permitted'
  describe sshd_config do
    its('PermitRootLogin') { should cmp 'no' }
  end
end

control 'AWS environment variables' do
  impact 1.0
  title 'SSHD Configuration AcceptEnv should not contain AWS_*'
  desc 'AWS environment variables should not be forwarded to admin servers' 
  describe sshd_config do 
    its('AcceptEnv') { should_not include 'AWS_*' }
  end
end

control 'OpenStack environment variables' do
  impact 1.0
  title 'SSHD Configuration AcceptEnv should not contain OS_*'
  desc 'OpenStack environment variables should not be forwarded to admin servers' 
  describe sshd_config do 
    its('AcceptEnv') { should_not include 'OS_*' }
  end
end
