# CephAIO
Creates an AIO for ceph using LXC containers


To build

` ansible-playbook -i inventory build.yml `

To Teardown

` ansible-playbook -i inventory teardown.yml `


This currently only works in Rackspace Public Cloud. Once testing has been done on other platforms, it will be added to the list of supported platforms.


After using the teardown playbook, ensure that the ceph disk has been completely wiped. Ceph leaves some residual data that interferes with future deployments. The teardown playbook currently uses ` shred ` to perform the data wipe, but I am pretty sure that removing the block device and adding a new one would accomplish the same result.
