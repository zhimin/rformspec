require File.dirname(__FILE__) + "/driver"
require 'singleton'

module RFormSpec

  class Process
    include Singleton
    include Driver

    def self.run(prog, work_path = nil)
      instance._run(prog, work_path)
    end

    def self.execute(prog, work_path = nil)
      instance._run(prog, work_path)
    end

    # --
    # instance methods
    def _run(program, work_path = nil)
      driver.Run(program, work_path)
    end


  end

end
