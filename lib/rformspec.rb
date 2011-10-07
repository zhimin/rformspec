#***********************************************************
#* Copyright (c) 2006, Zhimin Zhan.
#* Distributed open-source, see full license in MIT-LICENSE
#***********************************************************

# Extra full path to load libraries
require File.dirname(__FILE__) + "/rformspec/driver"
require File.dirname(__FILE__) + "/rformspec/control"
require File.dirname(__FILE__) + "/rformspec/mouse"
require File.dirname(__FILE__) + "/rformspec/keyboard"
require File.dirname(__FILE__) + "/rformspec/window"
require File.dirname(__FILE__) + "/rformspec/open_file_dialog"
require File.dirname(__FILE__) + "/rformspec/saveas_file_dialog"
require File.dirname(__FILE__) + "/rformspec/process"
require File.dirname(__FILE__) + "/rformspec/form_testcase"

module RFormSpec

  class AutoIt

    def self.init
      $a3 = WIN32OLE.new('AutoItX3.Control')

      $a3.AutoItSetOption("WinSearchChildren", 1); # Search Children window as well
      $a3.AutoItSetOption("WinTitleMatchMode", 2); 

      $a3.AutoItSetOption("CaretCoordMode", 0);
      $a3.AutoItSetOption("ColorMode", 1);
      $a3.AutoItSetOption("MouseCoordMode", 0);
      $a3.AutoItSetOption("PixelCoordMode", 0);
      $a3.AutoItSetOption("SendKeyDelay", 15)
      return $a3
    end

    def self.set_option(key, value)
      self.init if $a3.nil?
      $a3.AutoItSetOption(key, value)
    end

  end
end
