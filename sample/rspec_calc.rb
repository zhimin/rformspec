require File.dirname(__FILE__) + '/calc'

class RSpecCalc
  include Calc

  def setup
    init # initialize
    @calc_win = find_existing_calc_win
    if @calc_win.nil?
      @calc_win = start_calc
    end
  end
end

module Spec
  module Runner
    class Context
      def before_context_eval
        #inherit RSpecCalc # inherit not supported after 0.8
        inherit_context_eval_module_from RSpecCalc
      end
    end
  end
end
