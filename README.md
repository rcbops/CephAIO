# CephAIO

Creates an AIO for ceph using LXC containers

The goal of this project was to create an all in one enviroment of ceph that resembled what a production ceph cluster may look like. Each container is treated as a "server". 

```
-------------------------------------------------------------------
| Container |    IP     |                  Type                   |
-------------------------------------------------------------------
| cephadmin | 10.0.3.51 | Deployment Host, ceph monitoring host   |
| cephmon   | 10.0.3.52 | ceph monitoring host                    |
| cephosd1  | 10.0.3.53 | ceph monitoring host, ceph osd host     |
| cephosd2  | 10.0.3.54 | ceph osd host                           |
| cephosd3  | 10.0.3.55 | ceph osd host                           |
-------------------------------------------------------------------
```


Known to Work on:
  Rackspace Public Cloud
    - 15 GB Compute v1
    - Ubuntu 16.04 LTS (Xenial Xerus) (PVHVM)
    - 75 GB Standard SATA block device attached as /dev/xvdb

### To build

` ansible-playbook -i inventory build.yml `

### To Teardown

` ansible-playbook -i inventory teardown.yml `

After using the teardown playbook, ensure that the ceph disk has been completely wiped. Ceph leaves some residual data that interferes with future deployments. The teardown playbook currently uses ` shred ` to perform the data wipe (this takes awhile), but I am pretty sure that removing the block device and adding a new one would accomplish the same end result.


TO DO: 

- Add variable to control the number of osds deployed
- Add variable to remove the hardcoded /dev/xvdb

