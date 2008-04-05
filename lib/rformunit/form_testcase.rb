#***********************************************************
#* Copyright (c) 2006, Zhimin Zhan.
#* Distributed open-source, see full license in MIT-LICENSE
#***********************************************************

require 'test/unit'

module RFormUnit
   class FormTestCase < Test::Unit::TestCase
      include RFormUnit::Driver

      def default_test
         super unless(self.class == FormTestCase)
      end

      # assert the block's return value  instance every 1 second until timeout with specifed duration  
      def timeout_check_equal(duration, expected, &block)
         execute_ok = false
         duration.times do
            sleep(1)
            text = instance_eval(&block)
            execute_ok = true and break if (text == expected)
         end
         execute_ok.should == true
      end

      #
      def timeout_check_include?(duration, expected, &block)
         execute_ok = false
         duration.times do
            sleep(1)
            text = instance_eval(&block)
            execute_ok = true and break if text and text.include?(expected)
         end
         execute_ok.should == true
      end
      alias timeout_check_include timeout_check_include?

   end
end
