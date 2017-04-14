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

  - `playbook/private_vars/common.yml`: Change OS and MySQL's root password which you like.
```
---
os_account:
  password: YOUR_PASSWORD_OF_OS_ROOT_USER
db_account:
  password: YOUR_PASSWORD_OF_MYSQL_ROOT_USER
```

3. Install ansible roles from ansible galaxy

```
$ ansible-galaxy install --roles-path playbook/roles williamyeh.fluentd
```



Usage
=====

Run vagrant to start servers.
```sh
$ vagrant up

```
And, configure SSH keys.


Then, run the playbook.
```sh
$ ansible-playbook -i playbook/hosts playbook/main.yml
```



