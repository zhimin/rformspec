require 'win32ole'

module RFormSpec
  module Driver

    def driver
      return $a3 if $a3
      return RFormSpec::AutoIt.init
    end

    def wait_for_window(win, timeout=30)
      driver.WinWait(win.title, win.text, timeout * 1000)
      win
    end

    def wait_and_focus_window(title, text="",  timeout=30)
      driver.WinWaitActive(title, text, timeout * 1000)
      driver.WinActivate(title, text)
    end

    def window_exists?(title)
      driver.WinExists(title)  >  0
    end

    def focus_window(title)
      driver.WinActivate(title)
    end

    def close_window(title)
      driver.WinClose(title)
    end

    # wrapper of keyboard operations
    def key_press(keys)
      if keys =~ /^Ctrl\+([A-Z])$/
        filtered_keys = "^+#{$1}"
      elsif keys =~ /^Ctrl\+Shift\+([A-Z])$/
        filtered_keys = "^+#{$1.downcase}"
      elsif keys =~ /^Alt+([A-Z])$/
        filtered_keys = "!+#{$1}"
      elsif keys =~ /^Alt\+Shift\+([a-z])$/
        filtered_keys = "!+#{$1.downcase}"
      else
        filtered_keys = keys
      end
      filtered_keys = keys.gsub("Alt+", "!+").gsub("Ctrl+", "^+")
      RFormSpec::Keyboard.press(filtered_keys)
      sleep 0.5
    end
    alias press_key key_press

    # Wrapper of mouse operation
    def mouse_move(x, y)
      RFormSpec::Mouse.move_to(x, y)
    end

    def mouse_click(x, y)
      RFormSpec::Mouse.click(x, y)
    end

    # standard open file dialog
    def open_file_dialog(title, filepath)
      wait_and_focus_window(title)
      dialog = RFormSpec::OpenFileDialog.new(title)
      dialog.enter_filepath(filepath)
      sleep 1
      dialog.click_open
    end

    #TODO: save as file dialog
  end
end
