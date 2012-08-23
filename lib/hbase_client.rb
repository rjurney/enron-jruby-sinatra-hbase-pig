# Adapted from obsolete example at http://wiki.apache.org/hadoop/Hbase/JRuby

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
import org.apache.hadoop.hbase.util.Writables
import org.apache.hadoop.hbase.util.Bytes
import org.apache.hadoop.io.Text

class HBaseClient
  
  attr_accessor :table
  
  def initialize()
    @table = nil
  end
  
  # Connect to HBase and our table
  def connect(table_name)
    conf = HBaseConfiguration.create
    admin = HBaseAdmin.new(conf)
    admin.tableExists('enron')
    tables = admin.listTables
    @table = HTable.new(conf, 'enron')
  end
  
  def get(key)
    get = Get.new(key.to_java_bytes)
    result = @table.get(get)
    kv = result.list.first
    family = String.from_java_bytes(kv.get_family)
    qualifier = org.apache.hadoop.hbase.util.Bytes::toStringBinary(kv.get_qualifier)
    column = "#{family}:#{qualifier}"
    value = to_string(column, kv, -1)
    timestamp = kv.get_timestamp
    str_value = org.apache.hadoop.hbase.util.Bytes::toStringBinary(kv.get_value)
    return timestamp, str_value
  end
  
  # Make a String of the passed kv
  def to_string(column, kv, maxlength = -1)
    if kv.isDelete
      val = "timestamp=#{kv.getTimestamp}, type=#{org.apache.hadoop.hbase.KeyValue::Type::codeToType(kv.getType)}"
    else
      val = "timestamp=#{kv.getTimestamp}, value=#{org.apache.hadoop.hbase.util.Bytes::toStringBinary(kv.getValue)}"
    end
    val
  end
  
end