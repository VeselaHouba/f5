Role Name
=========

A brief description of the role goes here.

Requirements
------------

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
Check default values in `defaults/main.yml`. This project is currently under heavy development, so documentation is not maintained. It will be filled once the project changes settle down.

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

## Partitions:
If you want to use specific partitions, then you have to define absolute paths to cross-partition resources. Only resources in the same partition are searched without prefix.

f5_partitions:
  - name: test_part
    description: testing partition

f5_virtual_servers:
  - name: part_test
    destination: 10.0.0.1
    port: 80
    pool: pool_part_test
    profiles:
      - /Common/some_profile
      - name: /Common/other_profile
        context: client-side
      - name: /Common/tcp-wan-optimized
        context: client-side
      - name: /Common/tcp-lan-optimized
        context: server-side
    enabled_vlans:
      - /Common/some_vlan
    irules:
      - /Common/some_irule_in_common
      - some_irule_in_test_part
    partition: test_part



License
-------

BSD

Author Information
------------------
Jan Michalek (michalek_at_m-cloud.cz)
