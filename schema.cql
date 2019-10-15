DROP KEYSPACE IF EXISTS sales2;
CREATE KEYSPACE sales2 WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };

use sales2;

CREATE TABLE sales2.records (
   Region varchar,
   Product varchar,
   Date date,
   Sales float,
   PRIMARY KEY (Region)
);
