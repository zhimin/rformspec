require File.dirname(__FILE__) + "/driver"
require File.dirname(__FILE__) + "/control"

module RFormSpec

  class Window  < BaseControl
    attr_accessor :title, :text
    
    ##
    # title : page title, depends autoit options, might use as substring match or exact match
    # text:  some text in window for further identifing the window
    # options: 
    #   present => true | false,   already there
    #   wait_timeout: wiat for maxium seconds if not active, throw error
    #    (active: means the window becomes the active window)
    # otherwise, inside window class, using focus_window methods
    def initialize(title, text = '', options = {:present => false, :wait_timeout => 0})
      # for some windows, the title might change depends when it is invoked
      if title.class == Array
        title.each { |a_title|
          @title = a_title
          @text = text if text
          timeout = options[:wait_timeout]
          result = driver.WinWaitActive(@title, @text, timeout)
          return if result != 0
        }
        raise "timeout while waiting for window: #{self.to_s}"
      end

      @title = title
      @text = text if text
      timeout = options[:wait_timeout]
      if options[:present]
        result = driver.WinActivate(@title, @text)
        raise "window not found: #{self.to_s}" if result == 0
      elsif timeout && timeout.to_i > 1 then
        result = driver.WinWaitActive(@title, @text, timeout)
        raise "timeout while waiting for window: #{self.to_s}" if result == 0
      end
    end

    def focus
      driver.WinActivate(@title, @text)
    end

    def close
      driver.WinClose(@title, @text)
    end

    def exists?
      driver.WinExists(@title, @text)
    end

    def get_text
      driver.WinGetText(@title, @text)
    end

    def set_control_text(control_id, new_text)
      BaseControl.new(self, control_id).set_text(new_text)
    end

    def click_button(btn_id)
      Button.new(self, btn_id).click
    end

    def show_dropdown(combo_id)
      combo = ComboBox.new(self, combo_id)
      combo.show_dropdown
      combo
    end

    def hide_dropdown(combo_id)
      combo = ComboBox.new(self, combo_id)
      combo.hide_dropdown
      combo
    end

    def focus_control(ctrl_id)
      BaseControl.new(self, ctrl_id).focus
    end

    def send_control_text(ctrl_id, text)
      BaseControl.new(self, ctrl_id).send_text(text)
    end

    def get_control_text(ctrl_id)
      BaseControl.new(self, ctrl_id).get_text
    end

    #Not fully verified yet
    def statusbar_text
      driver.StatusbarGetText(@title)
    end

    def pixel_color(x,y)
      driver.PixelGetColor(x,y)
    end
    alias pixel_colour pixel_color
    alias get_pixel_colour pixel_color
    alias get_pixel_color pixel_color


    def to_s
      "Window{title => '#{@title}', text=>'#{@text}'}"
    end

    # a list
    def button(button_id)
      RFormSpec::Button.new(self, button_id)
    end

  end

end
