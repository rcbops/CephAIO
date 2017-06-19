# CephAIO
Creates an AIO for ceph using LXC containers


To build

` ansible-playbook -i inventory build.yml `

To Teardown

` ansible-playbook -i inventory teardown.yml `


This currently only works in Rackspace Public Cloud. Once testing has been done on other platforms, it will be added to the list of supported platforms.
