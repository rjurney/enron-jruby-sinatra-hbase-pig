require 'lib/hbase_client'

hclient = HBaseClient.new
hclient.connect('enron6')
result = hclient.get_key("02cd13f6-d1a6-4920-8b0a-1a73d63906e3") # replace with one from a scan
puts result
