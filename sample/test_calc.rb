require 'rformspec'

class CalcTest < RFormSpec::FormTestCase
  include RFormSpec::Driver

  def setup
    RFormSpec::AutoIt.init

    if window_exists?("Calculator")
      focus_window('Calculator')
      RFormSpec::Window.new('Calculator')
    else
    RFormSpec::Process.run("calc.exe")
    end

    @calc_win = RFormSpec::Window.new('Calculator', "", :wait_timeout => 2)
  end

  def teardown
    # @calc_win.close
  end

  def test_multiple
    @calc_win.click_button('127')  #3
    @calc_win.click_button('91')   #*
    @calc_win.click_button('131')  #7
    @calc_win.click_button('112')  #=
    sleep 1
    assert_equal "21. ", @calc_win.get_control_text('403')

  end

end
