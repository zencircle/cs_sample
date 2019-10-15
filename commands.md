### Load data
```
NODEIP=`hostname -I | awk '{ print $1 }'` ; echo $NODEIP
CQLSH=`find /var/lib/mesos/slave/slaves -name cqlsh | grep -v javadoc | head -n1`
NODETOOL=`find /var/lib/mesos/slave/slaves -name nodetool | grep -v javadoc | head -n1`

$CQLSH -u XXX -p XXX $NODEIP  9042 --cqlversion="3.4.4" < schema2.cql
COPY sales2.records (Region,Product,Date,Sales) FROM 'Data_1.csv' WITH DELIMITER=',' AND HEADER=TRUE;
```
#row count from csv
```
wc Data_1.csv 
  2500001   5000001 114096667 Data_1.csv
```
## sstable-tools row count
```
wget https://github.com/tolbertam/sstable-tools/releases/download/v3.11.0-alpha11/sstable-tools-3.11.0-alpha11.jar
java -jar sstable-tools-3.11.0-alpha11.jar cqlsh

cqlsh> use md-45-big-Data.db;
Using: /var/lib/mesos/slave/volumes/roles/cassandra-role/33582990-3695-4b56-8d7b-8ced5d2caac6/data/sales2/records-bdb44de0eca511e9ab7eb157f20092f7/md-45-big-Data.db
cqlsh> describe sstables ;
..
totalRows: 9108338
```
### Documentation
https://www.datastax.com/blog/2013/04/counting-keys-cassandra  
