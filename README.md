Role Name
=========

A brief description of the role goes here.

Requirements
------------

pip install --user f5-sdk

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
