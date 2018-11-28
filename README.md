Role Name
=========

A brief description of the role goes here.

Requirements
------------

TODO: bigip_asm_policy_fetch currently not working

This module requires ansible 2.8 for following function:
bigip_asm_policy_fetch

# How to make it work
If you don't want to mess with your default env, install everything in virtualenv
```
pip install vitualenv
virtualenv ansible-dev
source ansible-dev/bin/activate
pip install --user f5-sdk
pip install git+https://github.com/ansible/ansible.git@devel
```

Next time you just need to activate it again

```
source ansible-dev/bin/activate
```


## Role Variables

### iRules:
You can define path for iRule relative to your playbook

```
f5_iRules_list:
  - { name: irule_ib-block_ip, file: ../files/iRules/irule_ib-block_ip.tcl}
```

Or use one of pre-defined iRules inside this role `files/iRules/` and reference only by it's name

```
f5_iRules_list:
  - { name: irule_example }
```


Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
