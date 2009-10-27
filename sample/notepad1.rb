require 'rformspec'

include RFormSpec::Driver

RFormSpec::Process.run("C:\\WINDOWS\\NOTEPAD.EXE")
notepad_win = RFormSpec::Window.new('Untitled - Notepad')
RFormSpec::Keyboard.type("Hello from Notepad, {ENTER}1 2 3 4 5 6 7 8 9 10{ENTER}")
sleep(0.5)
RFormSpec::Keyboard.press("+{UP 2}")
sleep(0.5)
notepad_win.close

notepad_confirm_dialog = RFormSpec::Window.new('Notepad', 'No')
notepad_confirm_dialog.click_button('&No')
