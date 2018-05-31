title 'linux'

include_controls 'linux-baseline' do 
  skip_control 'os-05'
  skip_control 'os-06'
  skip_control 'os-08'
  skip_control 'package-08'
  skip_control 'sysctl-31b'
end
