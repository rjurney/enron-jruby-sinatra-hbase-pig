require 'rubygems'
require 'json'
require 'lib/hbase_client'
require 'lib/data_utils'
require 'sinatra'

hclient = HBaseClient.new
hclient.connect('enron6')

get '/pairs/:message_id' do |message_id|
  vals = hclient.get_key(message_id)
  return JSON(hclient.get_key(message_id))
end

get '/create_uuid' do
  "This web service shares code with a Pig JRuby UDF to produce this UUID: " + DataUtils.uuid
end
