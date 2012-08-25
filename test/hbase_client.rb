require 'lib/hbase_client'

hclient = HBaseClient.new
hclient.connect('enron6')
result = hclient.get_key("004230a4-a98a-4792-b2ae-df18b307f6b7") # replace with one from a scan
puts result