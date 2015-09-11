[[
Title: Linux Cookbook
author: PyKwiki
description: The default PyKwiki startup page.
tags: [linux,shell,text]
]]

# THE LINUX Cookbook, PREP FOR LINUX FOUNDATION SYSADMIN CERTIFICATION

## GOALS

### Local System Administration

  1. Creating backups
  2. Creating local user groups
  3. Managing file permissions
  4. Managing fstab entries
  5. Managing the startup process and related services
  6. Managing user accounts
  7. Managing user account attributes
  8. Managing user processes
  9. Restoring backed up data
  10. Setting file permission and ownership

### Local Security

  1. Accessing the root account
  2. Using sudo to manage acces to the root account

### Shell scripting

  1. Basic shell scripting

### Software management

  1. Installing software packages

### Command line

  1. Editing text files on the command line
  2. Manipulating text files from the command line

### Filesystem &amp; storage

  1. Archiving and compressing files and directories
  2. Assembling partitions as LVM devices
  3. Configuring swap partitions
  4. File attributes
  5. Finding files on the filesystem
  6. Formatting filesystems
  7. Mounting filesystems automatically at boot time
  8. Mounting networked filesystems
  9. Partitioning storage devices
  10. Troubleshooting filesystem issues

## RESOURCES

  1. [LFS 101X introduction to linux](https://www.edx.org/course/linuxfoundationx/linuxfoundationx-lfs101x-introduction-1621)
  2. [Linux.com New user guides](http://www.linux.com/learn/new-user-guides)
  3. [Linux foundation youtube channel](http://www.youtube.com/user/TheLinuxFoundation)
  4. [Linux.com learn guides](http://www.linux.com/learn)
  5. Ops School
    1. [Text editing](http://www.opsschool.org/en/latest/text_editing_101.html)
    2. [Unix fundamentals : file systems](http://www.opsschool.org/en/latest/filesystems_101.html)
  6. [100 videos linux tutorial videos](http://video.linux.com/categories/100-linux-tutorials-campaign)
  7. [Top 10 guides for linux basics](https://www.linux.com/learn/linux-certifications/795683-tecmints-10-part-guide-to-linux-foundation-sysadmin-certification)

## VOCABULARY

**Virtual Terminal :** Console sessions that use the entire display and keyboard outside of a graphical environment
**X Window System :** Graphical interface (low level) used in linux. X for Xorg
**Dangling link :** Symbolic link pointing to a non-existing file or folder
**SPOOL :** Simultaneous Peripheral Operations On-line. Buffering used to communcate at peripheral's rate, avoiding the slowing of the system.

## ADMINISTRATION

### Sudoers

All set up in `/etc/sudoers` and `/etc/sudoers.d/`
The command to edit privileges is `visudo`.
while `su` prompts to login as root, `sudo` prompts for root privileges.
The syntax is following :

`username ALL=(ALL) ALL`

The file must have permissions set to 440.

### User information

All stored in `/etc/passwd`, with 7 fields :
* username
* password (or x if encrypted in `/etc/shadow`)
* UserID (0 is root, 1-99 are predifined accounts, 100-999 reserved for system accounts and groups)
* GroupID (stored in `/etc/group`)
* User Info (optional, user name)
* Home directory
* Shell (bin absolute path)

`/etc/shadow` contains the SHA-512 encrypted password...
`chage` allows to set expire dates to passwords.
The PAM module can enforce high complexity passwords.
A password prompt can be configured for the boot loader (GRUB2)

### Accounts types

#### root

Authentified through `su`
The most privileged account.
Can :
* add accounts
* change user passwords
* examinate log files
* install packages
* edit system files
* manage system services
* manage groups

Extra care must be taken.

#### system

#### normal

Can :
* Run a network client
* use devices such as printers
* operate on files on which user has permissions
* run **SUID-root applications** like with `sudo`

SUID stands for Set owner User ID. It provides temporary permissions to a user to run aprogram with the permissions of the file owner.

#### network

## FILE PRIVILEGES

### Codes

1 : x
2 : w
4 : r

### Tools

`chown` change file/dir ownership
`chgrp` change file/dir group affiliation(s)
`chmod` change file/dir permissions

## NOTEWORTHY CONFIG FILES

`/etc/apt/sources.list` List of apt packages servers
`/etc/default/grub` Grub config file (needs grub-updates for changes to take effect)
`/etc/fstab` Startup mount devices description
`/etc/sudoers.d/` Folder to config sudo users
`/etc/sudoers` Sudo config file. Syntax is `who where = (as_whom) what`
`/etc/hosts.allow` &amp;&amp; `/etc/hosts.deny` politique de connexions distantes
`/etc/resolv.conf` dns system server
`/etc/hosts` system hosts
`/etc/group` groups declaration
`/etc/passwd` users general config

## NOTEWORTHY PROGRAMS


    find
        -ctime <time> (which metadata has been modified, like user permissions)
        -mtime <time> (which has been modified, created)
        -atime <time> (which has been read)
        -type <d,f,l> (which type is folder, file, symlink)
        -P            (do not follow symlinks)
        -name <expr>  (containing name in expr)
        -exec <cmd>   (execute command for each match {})
        -ok           (idb but prompts user before each execution)

    toutch file / create a new file

    man cmd / get information about cmd
    -a  (get all pages)
    -k  (get refering pages)
    -f  (get à propos, eq with whatis)

    whereis,which cmd / locate command

    whatis cmd / get a short description of cmd

    df -Th / display information about mounted filesystems including usage statistics

    expect / automates interaction with command line interactive programs

    diff  / Show difference between files
        -c provide a list of differences that include 3 lines of context
        -r recusrsively compare subdirectories as well as the current dir
        -i ignore the case of letters
        -w ignore differences in spaces and tabs

    dd if=/dev/input-device of=/dev/output-device / copie brute

    shopt / configure shell option

    useradd <user> / Create user
    userdel <user> / Delete user
    passwd <user>  / Define user password
    groupadd <group> / Create group
    groupdel <group> / Delete group
    usermod <modifications> <login> / Apply modifications to account identified by login, like adding / removing belonging to a group, defining user HOME directory, locking up the account
    groupmod <modifications> <group> / Apply modifications to group identified by name.
    groups
    id
    who
    whoami
    last / Show last activity timestamp relative to accounts

    ip
    ifconfig
    nslookup
    host
    trace
    traceroute
    ethtool // Queries network interfaces and can also set various parameters such as speed
    netstat // Display all active connections and routing tables
    nmap    // Scans open ports on a network
    tcpdump // Dumps network traffic for analysis
    iptraf  // Monitors network traffic in text mode
    hostname //


## NOTEWORTHY COMMANDS


    diff -Nur originalfile newfile > patchfile // create a patchfile
    patch originalfile patchfile // patch a single file
    patch -p1 < patchfile // patch a directory
    date -d "$(</proc/uptime awk '{print $1}') seconds ago" // get the date & time since system is up


## PLACES TO REMEMBER AND File Hierarchy Standard

cf [official documentation](http://www.pathname.com/fhs/pub/fhs-2.3.html)

### ROOT


    /bin            : essential user command binaries
    /boot           : static files of the boot loader
    /dev            : devices files
        ./null      : dumb device that discards any redirected output
        ./zero      : source of zeroed data
        ./tty       : this device is a synonym of the controlling terminal of a process. eg "echo 'yolo' >> /dev/tty" will print 'yolo' in the terminal.
    /etc            : host specific system configuration
        ./opt       : configuration files for /opt
        ./X11       : configuration files for the X Window System (opt)
        ./sgml      : configuration files for SGML (opt)
        ./xml       : configuration files for XML (opt)
    /home           : user specific directories
    /lib        : Essential shared libraries and kernel modules
    /media          : mount point for removable medias
    /mnt            : mount point for temporarily mounted filesystems
    /opt            : add on application software packages
    /proc           : kernel and virtual process information filesystem
    /root           : home directory for the root user
    /sbin           : system binaries
    /srv            : data for services provided by this system
    /tmp            : temporary files


### USR

The `/usr` directory is the second major section of the FHS. It contains all read-only, shareable data. It shall not be written to.


    ./bin       : most user commands
    ./include       : header files included by C programs
    ./lib           : libraries
    ./local         : for use by the sysadmin when installing software locally. It needs to be safe from being overwritten when the system software is updated
        ./bin       : local binaries
        ./etc       : host specific system configuration for local binaries
        ./games     : local game binaries
        ./include   : local C header files
        ./lib       : local libraries
        ./man       : local online manual
        ./sbin      : local system binaries
        ./share     : local architecture independant hierarchy
        ./src       : local sources
    ./sbin          : non vital system binaries
    ./share         : architecture independant data
    ./share/doc     : package-specific documentation
    ./src           : source files (opt)
    ./games         : educational and games binaries


### VAR

`/var` contains variable data files. This includes spool directories and files, administrative and logging data, and transient and temporary files.


    ./cache       : application data cache
    ./crash       : system crash dumps (opt)
    ./games       : variable game data (opt)
    ./lib         : variable state information. A package must create a sub directory on its own, OR use the ./lib/misc folder if it uses one file alone.
    ./local       : variable data for /usr/local
    ./lock        : lock files. Name shall be LCK..deviceName, format must be HDB UUCP lock file format.
    ./log         : log files and dirs.
        .lastlog  : record of last login of each user
        .messages : system messages from syslogd
        .wtmp     : record of last logins and logouts
    ./opt         : variable data for /opt
    ./mail        : user mailbox spooling files
    ./run         : data relevant to running processes
    ./spool       : application spool data
    ./tmp         : temporary files preseverved between system reboots


## NETWORKING

5 Classes : A,B and C + D for multicast and E for future use
**First Octet signature** :
0 to 127 : class A
128 to 191 : class B
192 to 223 : class C

### Usefull programs

`dig`
`nslookup`
`host`
`ifconfig`
