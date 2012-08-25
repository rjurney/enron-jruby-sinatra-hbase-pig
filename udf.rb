require 'pigudf'
require 'lib/utils'

# Refer to our Utils class to share JRuby code between Pig and Sinatra
class Udfs < PigUdf
  # outputSchema "test:boolean"
  # def valid_email(value)
  #   Utils.valid_email(value)
  # end
  
  outputSchema "uuid:chararray"
  def uuid()
    Utils.uuid()
  end
end

