# LAMP stack setup based on CentOS 6.3 with Vagrant / Puppet

For anyone wanting to try out Vagrant, here's some sample code to help you setup your own LAMP dev sandbox quickly. It runs on CentOS 6.3 and the internal setup is done with Puppet.

Do not that the first run might take a while. Depending on your speed, 10 minutes to download the base VM (CentOS 6.3) and 5 minutes to startup and provision the VM. But subsequent startup should be quite fast.

You can spin up new boxes very easily. Just put your PHP scripts in the `projects` folder and add a new vhost. If you are lazy, just throw your PHP files into the `projects/webroot` folder.

This installs:

- Apache
- MySQL
- PHP
- phpMyAdmin

## Installation

1. Install VirtualBox

	Download from [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads). Remember to download the VirtualBox Extension Pack.

2. Install Vagrant
	
	Download from [http://downloads.vagrantup.com](http://downloads.vagrantup.com/).

3. Clone this repo into a local folder

	```bash
$ git clone git@github.com:miccheng/vagrant-lamp-centos63.git phpdev
```

4. Start Vagrant

	`cd` into the checked out folder to start the VM:

	```bash
$ vagrant up
```

## Usage

Update your host operating system's `/etc/hosts` file with the following entry:

```bash
192.168.56.60 phpdev.local
```

Now, you can reach the webroot with `http://phpdev.local` or `http://localhost:8080`.

To login into the VM type
```bash
$ vagrant ssh
```

To stop the VM:
```bash
$ vagrant suspend
```

To halt the VM:
```bash
$ vagrant halt
```

To destroy the VM:
```bash
$ vagrant destroy
```

The phpMyAdmin URL: `http://phpdev.local/phpmyadmin` or `http://localhost:8080/phpmyadmin`.

***Note:*** The MySQL username is `root`. There is no password specified for the MySQL root user. To secure it, you might want to SSH into the VM and run `mysql_secure_installation`.

## Attribution

Based on the excellent work from [Patrick Daether](https://github.com/pdaether/LAMP-CentOS-with-Vagrant).
