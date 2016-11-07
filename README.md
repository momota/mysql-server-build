mysql-server-build
==================

This is a vagrantfile and ansible playbooks for building MySQL servers.

Licence
=======

[MIT](http://opensource.org/licenses/MIT)


Installation
============

1. Clone this repository.

```sh
$ git clone https://github.com/momota/mysql-server-build
```

2. Fix contents

  - `Vagrantfile`
```diff
- N = 2
+ N = NUMBER_OF_SERVERS_YOU_WANT

- machine.vm.box = "centos66_64"
+ machine.vm.box = "YOUR_BOX"

- machine.vm.hostname = "db0#{machine_id}"
+ machine.vm.hostname = "HOSTNAME_#{machine_id}"

- machine.vm.network "private_network", ip: "10.10.10.#{machine_id}"
+ machine.vm.network "private_network", ip: "IP_ADDRESS.#{machine_id}"

ansible.groups = {
-  "master" => ["db01"],
+  "master" => ["YOUR_MASTER_DB"],
-  "slave"  => ["db02"]
+  "slave"  => ["YOUR_SLAVE_DB"]
}
```

  - `playbook/private_vars/common.yml`
```
---
db_account:
  password: YOUR_PASSWORD_OF_MYSQL_ROOT_USER
```

Usage
=====

run vagrant

```sh
$ vagrant up --provision
```


