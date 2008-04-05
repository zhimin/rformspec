require 'rformunit'

include RFormUnit::Driver

RFormUnit::Process.run("C:\\WINDOWS\\NOTEPAD.EXE")
notepad_win = RFormUnit::Window.new('Untitled - Notepad')
RFormUnit::Keyboard.type("Hello, Missing No. 5.{ENTER}1 2 3 4 6 7 8 9 10{ENTER}")
RFormUnit::Keyboard.press("+{UP 2}")

# move cursor up and insert the missing number
RFormUnit::Mouse.move_to(70, 65)
RFormUnit::Mouse.click
RFormUnit::Keyboard.type("5 ")

notepad_win.close

notepad_confirm_dialog = RFormUnit::Window.new('Notepad', 'The text')
notepad_confirm_dialog.focus
RFormUnit::Button.new(notepad_confirm_dialog, "7").click
