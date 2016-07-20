# How to change MySQL data directory

* Ubuntu 14.04.1 LTS
* MySQL 5.6

Following steps as below:

1. Stop MySQL
    
    sudo /etc/init.d/mysql stop
    
2. Copy the existing data directory (default located in /var/lib/mysql) using the following command(the old data directory can be removed after this step):

    sudo cp -R -p /var/lib/mysql /newpath
    
3. Edit the MySQL configuration file with the following command:

    sudo vi /etc/mysql/my.cnf
    
4. Look for the entry for datadir, and change the path (which should be /var/lib/mysql) to the new data directory.

5. In the terminal, enter the command:

    sudo vi /etc/apparmor.d/usr.sbin.mysqld
    
6. Look for lines beginning with /var/lib/mysql. Change /var/lib/mysql in the lines with the new path.
 
7. Save and close the file.

8. Restart the AppArmor profiles with the command:

    sudo /etc/init.d/apparmor reload
    
9. Restart MySQL

    sudo /etc/init.d/mysql restart
    
10. DONE

# How to change MySQL tmp directory

* Ubuntu 14.04.1 LTS
* MySQL 5.6

Following steps as below:

1. Stop MySQL
    
    sudo /etc/init.d/mysql stop
        
3. Edit the MySQL configuration file with the following command:

    sudo vi /etc/mysql/my.cnf
    
4. Look for the entry for tmpdir, and change the path (which should be /tmp) to the new data directory.

5. In the terminal, enter the command:

    sudo vi /etc/apparmor.d/usr.sbin.mysqld
    
6. Say the new path is /whatever/tmp, add below two lines to the file immediately after the date path

    /whatever/tmp/ r,
    /whatever/tmp/** rwk,
 

7. Save and close the file.

8. Restart the AppArmor profiles with the command:

    sudo /etc/init.d/apparmor reload
    
9. Restart MySQL

    sudo /etc/init.d/mysql restart
    
10. DONE
