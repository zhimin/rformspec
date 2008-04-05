require 'rformunit'

class CalcTest < RFormUnit::FormTestCase

   def setup
      RFormUnit::Process.run("calc.exe")
      @calc_win = RFormUnit::Window.new('Calculator')
   end

   def teardown
      @calc_win.close
   end

   def test_multiple
      @calc_win.click_button('127')  #3
      @calc_win.click_button('91')   #*
      @calc_win.click_button('131')  #7
      @calc_win.click_button('112')  #=
      assert_equal "21. ", @calc_win.get_control_text('403')

   end

end
