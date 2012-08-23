require 'lib/hbase_client'

hclient = HBaseClient.new
hclient.connect('enron')
result = hclient.get('row1')
puts result