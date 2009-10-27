require File.dirname(__FILE__) + "/driver"
require 'singleton'

module RFormSpec
  class Keyboard
    include Singleton
    include Driver

    def self.type(keys)
      instance._type(keys)
    end

    def self.press(key)
      instance._type(key)
    end

    # instance methods
    def _type(keystrokes)
      driver.Send(keystrokes)
    end
    alias _press _type

  end
end
