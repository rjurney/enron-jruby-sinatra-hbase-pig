require 'pigudf'
require 'lib/data_utils'

# Refer to our Utils class to share JRuby code between Pig and Sinatra
class Udfs < PigUdf  
  outputSchema "uuid:chararray"
  def uuid()
    DataUtils.uuid()
  end
end

