# Magic line
require 'java'

import java.util.UUID

class DataUtils
  # Create Unique IDs - code adapted from https://github.com/jdamick/uuid/blob/master/lib/uuid.rb
  def self.uuid()
    self.generate()
  end
  
  def self.generate()
    java.util.UUID.randomUUID().toString()
  end
end
