require File.dirname(__FILE__) + "/driver"
require 'singleton'

module RFormUnit

   class Mouse
      include Singleton
      include Driver
      
      def self.click(x=nil, y=nil)
         instance._click(x, y)
      end
      
      def self.right_click(x=nil, y=nil)
        instance._right_click(x, y)
      end
      
      def self.double_click(x, y)
        instance._double_click(x,y)
      end
      
      def self.move_to(x, y)
        instance._move_to(x,y)
      end
      
      
      # intance methods 
      
      def _click(x=nil, y=nil)
         if (x and y) then
            driver.MouseClick("left", x, y)
         else
            driver.MouseClick("left")
         end
      end

      def _right_click(x=nil, y=nil)
         if (x and y) then
            driver.MouseClick("right", x, y)
         else
            driver.MouseClick("right")
         end
      end

      def _double_click(x, y)
         driver.MouseClick("left", x, y, 2)
      end

      def _move_to(x, y)
         driver.MouseMove(x,y)
      end

   end

end
