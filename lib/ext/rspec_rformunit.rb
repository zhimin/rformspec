class RSpecFormUnit
  include YourModule # change to your module containing common methods used in your specs

  def setup
    @driver = GUIDriver.new()

    @driver.AutoItSetOption("CaretCoordMode",0);
    @driver.AutoItSetOption("ColorMode",1);
    @driver.AutoItSetOption("MouseCoordMode",0);
    @driver.AutoItSetOption("PixelCoordMode",0);
    @driver.AutoItSetOption("SendKeyDelay", 20)

    #Add it yourself

  end

  def timeout_check_equal(duration, expected, &block)
    execute_ok = false
    duration.times do
      sleep(1)
      text = instance_eval(&block)
      execute_ok = true and break if (text == expected)
    end
    execute_ok.should == true
  end

  def timeout_check_include?(duration, expected, &block)
    execute_ok = false
    duration.times do
      sleep(1)
      text = instance_eval(&block)
      execute_ok = true and break if text and text.include?(expected)
    end
    execute_ok.should == true
  end
end

module Spec
  module Runner
    class Context
      def before_context_eval
        inherit RSpecFormUnit
      end
    end
  end
end
