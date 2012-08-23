require 'lib/hbase_client'

hclient = HBaseClient.new
hclient.connect('enron')
hclient.get('row1')
