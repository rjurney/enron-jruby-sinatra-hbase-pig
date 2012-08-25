require 'lib/hbase_client'

hclient = HBaseClient.new
hclient.connect('enron4')
result = hclient.get_key("000387fb-02c0-4171-a93f-b134128fa") # replace with one from a scan
puts result