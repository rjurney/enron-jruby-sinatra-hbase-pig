require 'rubygems'
require 'sinatra'
require 'json'
require 'lib/hbase_client'
require 'lib/data_utils'

hclient = HBaseClient.new
hclient.connect('enron4')

get '/:message_id' do
  JSON hclient.get(message_id)
end

get '/create_uuid' do
  DataUtils.uuid.to_string
end
