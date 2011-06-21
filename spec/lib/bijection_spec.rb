require "spec_helper"

describe Bijection do
  subject { Bijection.new }

  it "initializes empty domain" do
    subject.domain.size.should == 0
  end

  pending "blah"
end
# stub
