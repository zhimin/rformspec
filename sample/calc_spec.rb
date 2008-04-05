require File.dirname(__FILE__) + '/rspec_calc'

context "Calculator" do

   setup do    
   end

  specify "Multiple works" do
    @calc_win.click_button('127')  #3
      @calc_win.click_button('91')   #*
      @calc_win.click_button('131')  #7
      @calc_win.click_button('112')  #=
      @calc_win.get_control_text('403').should == '21. '
   end

end
