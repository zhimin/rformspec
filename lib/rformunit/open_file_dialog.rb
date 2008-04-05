module RFormUnit
  class OpenFileDialog < RFormUnit::Window

    def initialize(title = "Open File")
      focus_window(title)
    end

    def enter_filepath(file_path)
      get_text # somehow calling it get it loaded
      set_control_text("Edit1", file_path)
    end

    def click_open
      click_button("Button2")
    end

  end

end
