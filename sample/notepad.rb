require 'rformspec'

include RFormSpec::Driver

RFormSpec::Process.run("C:\\WINDOWS\\NOTEPAD.EXE")
notepad_win = RFormSpec::Window.new('Untitled - Notepad')
RFormSpec::Keyboard.type("Hello, Missing No. 5.{ENTER}1 2 3 4 6 7 8 9 10{ENTER}")
RFormSpec::Keyboard.press("+{UP 2}")

# move cursor up and insert the missing number
RFormSpec::Mouse.move_to(70, 65)
RFormSpec::Mouse.click
RFormSpec::Keyboard.type("5 ")

notepad_win.close

notepad_confirm_dialog = RFormSpec::Window.new('Notepad', 'The text')
notepad_confirm_dialog.focus
RFormSpec::Button.new(notepad_confirm_dialog, "7").click
