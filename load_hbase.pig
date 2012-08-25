/* HBaseStorage shortcut */
register /me/pig/build/ivy/lib/Pig/hbase-0.94.1.jar
register /me/pig/build/ivy/lib/Pig/zookeeper-3.3.3.jar
register /me/pig/build/ivy/lib/Pig/guava-11.0.jar

address_pairs = LOAD 'hbase://enron4' using 
  org.apache.pig.backend.hadoop.hbase.HBaseStorage('address.pairs:from_address address.pairs:to_address address.pairs:total_sent')
  as (from_address:chararray, to_address:chararray, total_sent:long);

a = limit address_pairs 100;
dump a

/* (.ward@enron.com,s..olinger@enron.com,10)
(seanbunk@akllp.com,sarah.wesner@enron.com,5)
(tomskilljr@aol.com,ermak@gte.net,1)
(panacea1@swbell.net,etaylor@bcm.tmc.edu,4)
(kenneth.lay@enron.com,ibrahim.qureishi@enron.com,2)
(geneva.davis@enron.com,therese.candella@enron.com,2)
(michelle.cash@enron.com,norma.yeverino@enron.com,1)
(dejoun.windless@enron.com,lisa.mellencamp@enron.com,1)
(cindy.richardson@enron.com,marc.hensel@enron.com,1)
(ecdirect-daily@mail.energycentral.com,jason.wolfe@enron.com,2) */