require File.join(File.dirname(__FILE__), 'calc_helper')

describe 'Simple Calculation' do
  include CalcSpecHelper

  before (:all) do
    start_calc
  end

  after(:all) do
    exit_calc
  end

  it "can do adding" do
    click_3
    click_add
    click_7
    click_equals
    result.should == "10. "
  end

  it "can do muliply" do
    click_3
    click_multiply
    click_7
    click_equals
    result.should == "21. "
  end

  it "if you think above is good, we can make it more readable" do
    perform(%w(3 + 7 =)).should == "10. "
  end
end
