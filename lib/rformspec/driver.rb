require 'win32ole'

require File.join(File.dirname(__FILE__), "testwise_plugin.rb")

module RFormSpec
  module Driver

    include TestWisePlugin
    
    def driver
      dump_caller_stack
      return $a3 if $a3
      return RFormSpec::AutoIt.init
    end

    def wait_for_window(win, timeout=30)
      driver.WinWait(win.title, win.text, timeout * 1000)
    end

    def wait_and_focus_window(title, text="",  timeout=5)      
      try_for(timeout) { 
        found_window =  driver.WinExists(title, text) 
        raise "Window '#{title}' not found" unless found_window.to_i == 1
      }
      driver.WinActivate(title, text)
      sleep 0.5
      # check whether suceed
      puts "[DEBUG] => |#{driver.WinActive(title, text)}|"
        raise "Failed to make window '#{title}' active"
      end
      
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
      dump_caller_stack
      
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
    
    
    
    # helper 
    # Try the operation up to specified timeout (in seconds), and sleep given interval (in seconds).
    # Error will be ignored until timeout
    # Example
    #    try_for { click_link('waiting')}
    #    try_for (10, 2) { click_button('Search' } # try to click the 'Search' button upto 10 seconds, try every 2 seconds
    #    try_for { click_button('Search' }
    def try_for(timeout = 30, polling_interval = 1, &block)
      start_time = Time.now

      last_error = nil
      until (duration = Time.now - start_time) > timeout
        begin
          yield
          last_error = nil
					return true 
        rescue => e
          last_error = e
        end
        sleep polling_interval
      end

      raise "Timeout after #{duration.to_i} seconds with error: #{last_error}." if last_error
      raise "Timeout after #{duration.to_i} seconds."
    end
    
  end
end
