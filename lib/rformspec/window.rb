require File.dirname(__FILE__) + "/driver"
require File.dirname(__FILE__) + "/control"

module RFormSpec
  

  class Window  < BaseControl
    attr_accessor :title, :text

    def initialize(title, text = '', timeout = 10)      
      # for some windows, the title might change depends when it is invoked
      if title.class == Array 
        title.each { |a_title| 
          @title = a_title
          @text = text if text        
          result = driver.WinWaitActive(@title, @text, timeout)
          return if result != 0
        }
        raise "timeout while waiting for window: #{self.to_s}" 
      end
      
      @title = title
      @text = text if text
      result = driver.WinWaitActive(@title, @text, timeout)
      raise "timeout while waiting for window: #{self.to_s}" if result == 0    
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
