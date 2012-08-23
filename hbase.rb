# Adapted from 
include Java
import org.apache.hadoop.hbase.HBaseConfiguration
import org.apache.hadoop.hbase.HColumnDescriptor
import org.apache.hadoop.hbase.HConstants
import org.apache.hadoop.hbase.HTableDescriptor
import org.apache.hadoop.hbase.client.HBaseAdmin
import org.apache.hadoop.hbase.client.HTable
import org.apache.hadoop.hbase.client.Get
import org.apache.hadoop.hbase.client.Put
import org.apache.hadoop.hbase.client.ResultScanner
import org.apache.hadoop.io.Text

conf = HBaseConfiguration.create
admin = HBaseAdmin.new(conf)
admin.tableExists('enron')
tables = admin.listTables
table = HTable.new(conf, 'enron')
row = Text.new("row1")
get = Get.new("row1".to_java_bytes)
result = table.get(get)

# From https://github.com/apache/hbase/blob/trunk/hbase-server/src/main/ruby/hbase/table.rb
maxlength = -1

