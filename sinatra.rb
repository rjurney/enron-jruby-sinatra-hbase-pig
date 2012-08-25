require 'rubygems'
require 'sinatra'
require 'json'
require 'lib/hbase_client'

hclient = HBaseClient.new
hclient.connect('enron')

get '/:message_id' do
  JSON hclient.get message_id
end