/* Load Avro jars and define shortcut */
register /me/pig/build/ivy/lib/Pig/avro-1.5.3.jar
register /me/pig/build/ivy/lib/Pig/json-simple-1.1.jar
register /me/pig/contrib/piggybank/java/piggybank.jar
define AvroStorage org.apache.pig.piggybank.storage.avro.AvroStorage();
define HBaseStorage org.apache.pig.backend.hadoop.hbase.HBaseStorage();

/* Register our JRuby UDFs */
register 'udf.rb' using jruby as udfs;

emails = load '/me/tmp/enron.avro' using AvroStorage();
tested_emails = foreach emails generate from.address, udfs.valid_email(from.address) as is_valid:boolean;
invalid_emails = filter tested_emails by is_valid == false;

store invalid_emails into 'hbase://enron' USING 

copy = STORE raw INTO 'hbase://SampleTableCopy'
       USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
       'info:first_name info:last_name friends:* info:*')
       AS (info:first_name info:last_name buddies:* info:*);

/* We have some invalid email addresses in the data:

("d@piassick".,false)
(carol.st.@enron.com,false)
(carol.st.@enron.com,false)
(carol.st.@enron.com,false)
(carol.st.@enron.com,false)
(carol.st.@enron.com,false)
(carol.st.@enron.com,false)
(carol.st.@enron.com,false)
(carol.st.@enron.com,false)
(carol.st.@enron.com,false)

*/