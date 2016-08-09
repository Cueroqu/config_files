This is a summary from page [this](https://dev.mysql.com/doc/refman/5.6/en/replication-gtids-howto.html).

**Step 1**  Synchronize the servers. Enable the read_only on master.

`mysql> SET @@global.read_only = ON;`

**Step 2** Stop all the servers

`shell> mysqladmin -uusername -p shutdown`

**Step 3** Restart all servers with GTIDs enabled

Run `mysqld_safe --gtid_mode=ON --log-bin --log-slave-updates --enforce-gtid-consistency & ` on master and `mysqld_safe --gtid_mode=ON --log-bin --log-slave-updates --enforce-gtid-consistency --skip-slave-start &` on slaves.

**Step 4** Direct the slave to use the master

`
mysql> CHANGE MASTER TO
     >     MASTER_HOST = '[host]',
     >     MASTER_PORT = port,
     >     MASTER_USER = '[user]',
     >     MASTER_PASSWORD = '[password]',
     >     MASTER_AUTO_POSITION = 1;
`

and assuming the statement has succeeded, then `mysql> start slave;`

**Step 5** Disable read_only on master
`
mysql> SET @@global.read_only = OFF;
`