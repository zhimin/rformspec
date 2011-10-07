require 'rformspec'

module CalcSpecHelper
  include RFormSpec::Driver

  def run_calc
    RFormSpec::Process.run("calc.exe")
    @calc_win = RFormSpec::Window.new('Calculator', "", :wait_timeout => 2)
  end
  alias start_calc run_calc

  def exit_calc
    @calc_win.close
  end

  def click_3
    @calc_win.click_button('127')  #3
    sleep(0.5)
  end

  def click_7
    @calc_win.click_button('131')  #7
    sleep(0.5)
  end

  def click_add
    @calc_win.click_button('92')   # +
    sleep(0.5)
  end
  alias click_plus click_add

  def click_multiply
    @calc_win.click_button('91')   #*
    sleep(0.5)
  end

  def click_equals
    @calc_win.click_button('112')  #=
    sleep(0.5)
  end

  def result
    @calc_win.get_control_text('403')
  end
  alias get_result result

  def perform(actions)
    methods_to_call = actions.collect { |act|
      case act
      when '+':
        'plus'
      when '-':
        'minus'
      when '*':
        'multiply'
      when '=':
        'equals'
      else
        act
      end
    }

    methods_to_call.each { |met|
      self.send("click_#{met}")
    }
    get_result
  end
end
