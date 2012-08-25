/* Load Avro jars and define shortcut */
register /me/pig/build/ivy/lib/Pig/avro-1.5.3.jar
register /me/pig/build/ivy/lib/Pig/json-simple-1.1.jar
register /me/pig/contrib/piggybank/java/piggybank.jar
define AvroStorage org.apache.pig.piggybank.storage.avro.AvroStorage();

/* HBaseStorage libraries */
register /me/pig/build/ivy/lib/Pig/hbase-0.94.1.jar
register /me/pig/build/ivy/lib/Pig/zookeeper-3.3.3.jar
register /me/pig/build/ivy/lib/Pig/guava-11.0.jar

/* Load JRuby to validat emails and creat UUIDs for HBase rowIds */
register 'udf.rb' using jruby as udfs;

emails = load '/me/tmp/enron.avro' using AvroStorage();
/* Project all unique combinations of from/to for each email to more than one person */
from_to = foreach emails generate from.address as from_address, FLATTEN(tos.(address)) as to_address;

/* Group by email from/to pairs and count emails between those addresses.
   Also, generate a UUID for storing rows in HBase. */
by_pair = group from_to by (from_address, to_address);
sent_counts = foreach by_pair generate udfs.uuid() as id, 
                                       FLATTEN(group) as (from_address, to_address), 
                                       COUNT_STAR(from_to) as total_sent;
                                       
/* Store to the HBase table 'enron' using a UUID as row key with the loadKey option. */
store sent_counts into 'enron6' using org.apache.pig.backend.hadoop.hbase.HBaseStorage('address.pairs:from_address address.pairs:to_address address.pairs:total_sent', 'loadKey true');
