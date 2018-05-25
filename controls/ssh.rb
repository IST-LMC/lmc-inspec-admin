title 'ssh'

include_controls 'ssh-baseline' do 
  skip_control 'ssh_spec'
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
