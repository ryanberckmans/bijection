require "bijection/version"
require "bijection/base"

module Bijection
  class << self
    def new
      Bijection::Base.new
    end
  end
end
