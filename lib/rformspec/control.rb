require File.dirname(__FILE__) + "/driver"

module RFormSpec
  class BaseControl
    include Driver

    attr_accessor :parent_win, :control_id

    def initialize(win, ctrl_id)
      @parent_win = win
      @control_id = ctrl_id
    end

    def set_text(new_text)
      driver.ControlSetText(@parent_win.title, @parent_win.text, @control_id, new_text)
    end

    def send_text(text)
      driver.ControlSend(@parent_win.title, @parent_win.text, @control_id, text)
    end
    alias send_keys send_text

    def get_text
      driver.ControlGetText(@parent_win.title, @parent_win.text, @control_id)
    end

    def focus
      driver.ControlFocus(@parent_win.title, @parent_win.text, @control_id)
    end

    def is_enabled?
      ret = driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "IsEnabled" ,"")
      ret == 1 or ret == "1"
    end

    def is_visible?
      ret = driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "IsVisible" ,"")
      ret == 1 or ret == "1"
    end

    def click
      driver.ControlClick(@parent_win.title, @parent_win.text, @control_id)
    end

  end

  class TextBox < BaseControl

  end

  class Label < BaseControl

  end

  class CheckBox < BaseControl
    def check
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "Check" ,"")
    end

    def uncheck
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "UnCheck" ,"")
    end

    def is_checked?
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "IsChecked" ,"") == 1
    end

  end

  class RadioButton < BaseControl
    def check
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "Check" ,"")
    end

    def uncheck
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "UnCheck" ,"")
    end

    def is_checked?
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "IsChecked" ,"") == 1
    end

  end

  class ComboBox < BaseControl

    def show_dropdown
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "ShowDropDown" ,"")
    end

    def hide_dropdown
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "HideDropDown" ,"")
    end

    def select_option(option)
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "SelectString" , option)
    end

  end


  class Button < BaseControl
  end

  class Tab < BaseControl

    def current
      driver.ControlCommand(@parent_win.title, @parent_win.text, @control_id, "CurrentTab" , "")
    end

  end

  class ListView < BaseControl

    def item_count
      result = driver.ControlListView(@parent_win.title, @parent_win.text, @control_id, "GetItemCount" , "", "").to_i
      result ? result.to_i : 0
    end

    # row and column index starts from 0,
    def get_item_text(row, col = 0)
      driver.ControlListView(@parent_win.title, @parent_win.text, @control_id, "GetText" , "#{row}", col)
    end

    # can't use select, as it is Ruby keyword
    def highlight(row_start, row_end = nil)
      row_end ||= row_start
      driver.ControlListView(@parent_win.title, @parent_win.text, @control_id, "Select" , "#{row_start}", "#{row_end}")
    end

    def de_highlight(row_start, row_end = nil)
      row_end ||= row_start
      driver.ControlListView(@parent_win.title, @parent_win.text, @control_id, "DeSelect" , "#{row_start}", "#{row_end}")
    end
    alias de_select de_highlight

    def subitem_count
      result =  driver.ControlListView(@parent_win.title, @parent_win.text, @control_id, "GetSubItemCount" , "", "").to_i
      result ? result.to_i : 0
    end

    def select_all
      driver.ControlListView(@parent_win.title, @parent_win.text, @control_id, "SelectAll" , "", "")
    end

    def is_selected?(row)
      1 == driver.ControlListView(@parent_win.title, @parent_win.text, @control_id, "IsSelected" , "#{row}", "")
    end

  end


end
