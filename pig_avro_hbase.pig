/* Load Avro jars and define shortcut */
register /me/pig/build/ivy/lib/Pig/avro-1.5.3.jar
register /me/pig/build/ivy/lib/Pig/json-simple-1.1.jar
register /me/pig/contrib/piggybank/java/piggybank.jar
define AvroStorage org.apache.pig.piggybank.storage.avro.AvroStorage();

/* HBaseStorage shortcut */
register /me/pig/build/ivy/lib/Pig/hbase-0.94.1.jar
register /me/pig/build/ivy/lib/Pig/zookeeper-3.3.3.jar
register /me/pig/build/ivy/lib/Pig/guava-11.0.jar

emails = load '/me/tmp/enron.avro' using AvroStorage();
from_to = foreach emails generate from.address as from_address, FLATTEN(tos.(address)) as to_address;
store from_to into 'enron2' using org.apache.pig.backend.hadoop.hbase.HBaseStorage('email:from_address email:to_address');

/*copy = STORE raw INTO 'hbase://SampleTableCopy'
       USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
       'info:first_name info:last_name friends:* info:*')
       AS (info:first_name info:last_name buddies:* info:*);*/

/*emails = LOAD 'hbase://enron' using org.apache.pig.backend.hadoop.hbase.HBaseStorage('email:from_address email:to_address')
  as (from_address:chararray, to_address:chararray);*/