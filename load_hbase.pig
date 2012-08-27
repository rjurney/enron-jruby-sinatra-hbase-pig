/* HBaseStorage shortcut */
register /me/pig/build/ivy/lib/Pig/hbase-0.94.1.jar
register /me/pig/build/ivy/lib/Pig/zookeeper-3.3.3.jar
register /me/pig/build/ivy/lib/Pig/guava-11.0.jar

/* Grab the top 100 most prolific email relationships from HBase and dump them. */
address_pairs = LOAD 'hbase://enron4' using 
  org.apache.pig.backend.hadoop.hbase.HBaseStorage('address.pairs:from_address address.pairs:to_address address.pairs:total_sent')
  as (from_address:chararray, to_address:chararray, total_sent:long);
sorted = order address_pairs by total_sent DESC;
top_100 = limit sorted 100;
dump top_100
