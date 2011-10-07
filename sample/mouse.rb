require 'rubygems'
require 'rformspec'

RFormSpec::AutoIt.set_option("WinSearchChildren", 1)

class TextWiseWindow < RFormSpec::Window
  def initialize(title = "TextWise", text = "", opts = {})
     super(title, text, opts)
     wait_and_focus_window(title) 
  end

end


win = TextWiseWindow.new("TextWise", "", :present => true)
win.mouse_move(90, 30)
#win.mouse_click(241, 645)
win.mouse_click(220, 640)
#RFormSpec::Mouse.move_to(200, 40)
