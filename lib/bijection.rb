require "bijection/version"
require "bijection/base"

# @example b = Bijection.new
module Bijection
  class << self
    # @return [Base]
    def new
      Bijection::Base.new
    end
  end
end
