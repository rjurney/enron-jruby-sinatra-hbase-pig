# From https://github.com/jdamick/uuid/blob/master/lib/uuid.rb
class UUID

  def self.generate(format = :default)
    @uuid ||= new
    @uuid.generate(format)
  end
  
  def initialize
  end

  ##
  # Formats supported by the UUID generator.
  #
  # <tt>:default</tt>:: Produces 36 characters, including hyphens separating
  # the UUID value parts
  # <tt>:compact</tt>:: Produces a 32 digits (hexadecimal) value with no
  # hyphens
  # <tt>:urn</tt>:: Adds the prefix <tt>urn:uuid:</tt> to the default format
  def generate(format = :default)
    raw_uuid = java.util.UUID.randomUUID().toString()
    result_uuid = nil
    case format
      when :default
        result_uuid = raw_uuid
      when :compact
        result_uuid = raw_uuid.gsub('-', '')
      when :urn
        result_uuid = "urn:uuid:" + raw_uuid
      else
        raise ArgumentError, "invalid UUID format #{format.inspect}"
    end
    result_uuid
  end
end

class DataUtils
  
  # Validate emails
  # def valid_email(value)
  #   begin
  #    return false if value == ''
  #    parsed = Mail::Address.new(value)
  #    return parsed.address == value && parsed.local != parsed.address
  #   rescue Mail::Field::ParseError
  #     return false
  #   end
  # end
  
  # Create Unique IDs
  def uuid()
    UUID.generate()
  end
end