control "ansible-role-awscli - #{os.name} #{os.release} - 01" do
  impact 1.0
  title 'Ansible role awscli'

  describe file('/usr/bin/aws') do
    it { should be_file }
  end

  describe file('/usr/local/bin/aws') do
    it { should be_symlink }
    its('link_path') { should eq '/usr/bin/aws' }
  end

  describe directory('/usr/local/sbin/aws') do
    it { should be_symlink }
    its('link_path') { should eq '/usr/bin/aws' }
  end

  describe command('/usr/bin/aws --version') do
    its('exit_status') { should eq 0 }
    its('stderr') { should match %r{^aws-cli/} }
  end
end
