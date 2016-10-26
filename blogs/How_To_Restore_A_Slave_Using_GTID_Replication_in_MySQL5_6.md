**Step 1** Dump Date

```
shell> mysqldump --all-databases --single-transaction --triggers --routines --host=127.0.0.1 --port=18675 --user=msandbox --password=msandbox > dump.sql
```

**Step 2** On all the slaves

```
slave> reset master;
slave> stop slave; // if start before
```

`
shell> mysql -uusername -ppassword < masterdump.sql
`

```
slave> change master to master_host='[]host]', master_port=3306, master_user='[repl username]', master_password='[repl password]', master_auto_position=1;
// Assuming succeeded
slave> start slave;
```