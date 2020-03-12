Ansible-role-awscli
===================

Install AWS Cli.

Requirements
------------

N/A

Role Variables
--------------

* `rhcentos_awscli_version`: if specified, will try to install this version of AWS Cli on Redhat/CentOS

Dependencies
------------

N/A

Example Playbook
----------------

```yaml
- hosts: all
  roles:
    - 'ansible-role-awscli'
```

License
-------

BSD

Author Information
------------------

FXInnovation Inc
