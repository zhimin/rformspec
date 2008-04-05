require 'rformunit'

module Calc
   include RFormUnit::Driver

   def start_calc
      RFormUnit::Process.run("calc.exe")
      RFormUnit::Window.new('Calculator')
   end

   def find_existing_calc_win
      if window_exists?("Calculator")
         focus_window('Calculator')
         RFormUnit::Window.new('Calculator')
      else
         nil
      end
   end

   def quit_calc
      focus_window('QPRIME')
      RFormUnit::Keyboard.press("!{F4}")
   end

end
