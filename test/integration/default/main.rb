control "ansible-role-awscli - #{os.name} #{os.release} - 01" do
  impact 1.0
  title 'Ansible role awscli'

  describe directory('/opt/venv/aws/') do
    it { should exist }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end

  describe file('/usr/local/bin/aws') do
    it { should be_file }
    its('mode') { should cmp '0555' }
  end

  describe directory('/usr/local/sbin/aws') do
    it { should be_symlink }
    its('link_path') { should eq '/usr/local/bin/aws' }
  end

  describe command('/usr/local/bin/aws --version') do
    it { should exist }
    its('exit_status') { should eq 0 }
    its('stdout') { should match %r{^aws-cli/} }
  end
end
