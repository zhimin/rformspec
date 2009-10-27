require 'rformspec'

module Calc
  include RFormSpec::Driver

  def start_calc
    RFormSpec::Process.run("calc.exe")
    RFormSpec::Window.new('Calculator')
  end

  def find_existing_calc_win
    if window_exists?("Calculator")
      focus_window('Calculator')
      RFormSpec::Window.new('Calculator')
    else
      nil
    end
  end

  def quit_calc
    focus_window('Calculator')
    RFormSpec::Keyboard.press("!{F4}")
  end

end
