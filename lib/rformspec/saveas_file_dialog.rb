module RFormSpec
  class SaveasFileDialog < RFormSpec::Window

    def initialize(title = "Save As")
      focus_window(title)
    end

    def enter_filepath(file_path)
      set_control_text("Edit1", file_path)
    end

    def click_save
      click_button("Button2")
    end

  end

end
