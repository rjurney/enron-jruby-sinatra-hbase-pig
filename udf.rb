require 'pigudf'
require 'mail'

class Udfs < PigUdf
  outputSchema "test:boolean"
  def valid_email( value )
    begin
     return false if value == ''
     parsed = Mail::Address.new( value )
     return parsed.address == value && parsed.local != parsed.address
    rescue Mail::Field::ParseError
      return false
    end
  end
end

