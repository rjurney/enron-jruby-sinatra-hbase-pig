/* HBaseStorage shortcut */
register /me/pig/build/ivy/lib/Pig/hbase-0.94.1.jar
register /me/pig/build/ivy/lib/Pig/zookeeper-3.3.3.jar
register /me/pig/build/ivy/lib/Pig/guava-11.0.jar

address_pairs = LOAD 'hbase://enron' using using org.apache.pig.backend.hadoop.hbase.HBaseStorage('email:from_address email:to_address email:total_sent')
  as (from_address:chararray, to_address:chararray, email:total_sent:long);

/*copy = STORE raw INTO 'hbase://SampleTableCopy'
       USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
       'info:first_name info:last_name friends:* info:*')
       AS (info:first_name info:last_name buddies:* info:*);*/

/*emails = LOAD 'hbase://enron' using org.apache.pig.backend.hadoop.hbase.HBaseStorage('email:from_address email:to_address')
  as (from_address:chararray, to_address:chararray);*/