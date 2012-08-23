/* Load Avro jars and define shortcut */
register /me/pig/build/ivy/lib/Pig/avro-1.5.3.jar
register /me/pig/build/ivy/lib/Pig/json-simple-1.1.jar
register /me/pig/contrib/piggybank/java/piggybank.jar
define AvroStorage org.apache.pig.piggybank.storage.avro.AvroStorage();

/* Register our JRuby UDFs */
register 'udf.rb' using jruby as udfs;

emails = load '/me/tmp/enron.avro' using AvroStorage();
tested_emails = foreach emails generate from.address, udfs.valid_email(from.address) as is_valid:boolean;
invalid_emails = filter tested_emails by is_valid == false;
a = limit invalid_emails 10;
dump a

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