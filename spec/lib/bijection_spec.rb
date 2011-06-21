require "spec_helper"

describe Bijection do
  before(:each) { @b = Bijection.new }

  it "initializes with empty domain" do
    i = 0
    @b.domain.each { i += 1 }
    i.should == 0
  end

  it "initializes with empty range" do
    i = 0
    @b.range.each { i += 1 }
    i.should == 0
  end

  it "initializes with empty size" do
    @b.size.should == 0
  end

  it "returns self when add is called" do
    @b.add(5, 3).should == @b
  end

  it "returns nil when inverse! is called" do
    @b.inverse!.should be_nil
  end

  it "add raises when x is nil" do
    expect { @b.add nil, "fooz" }.to raise_error
  end

  it "add raises when y is nil" do
    expect { @b.add 57, nil }.to raise_error
  end

  it "delete_by_x returns nil for x not in X" do
    @b.delete_by_x(5).should be_nil
  end

  it "delete_by_y returns nil for y not in Y" do
    @b.delete_by_y(5).should be_nil
  end

  context "with one pair added" do
    before :each do
      @x = 3
      @y = []
      @b.add @x, @y
    end

    it "finds x in the domain" do
      @b.domain.peek.should == @x
    end

    it "finds y in the range" do
      @b.range.peek.should == @y
    end

    it "finds x,y in each_pair" do
      @b.each_pair do |x,y|
        x.should == @x
        y.should == @y
      end
    end

    it "raises when x is re-added" do
      expect { @b.add @x, "fooz" }.to raise_error
    end

    it "raises when y is re-added" do
      expect { @b.add "sdfdsfs", @y }.to raise_error
    end

    it "returns x when given y" do
      @b.get_x(@y).should == @x
    end

    it "returns y when given x" do
      @b.get_y(@x).should == @y
    end

    it "returns nil when given x not in X" do
      @b.get_y(7).should be_nil
    end

    it "returns nil when given y not in Y" do
      @b.get_x("foo").should be_nil
    end

    it "returns x for delete_by_y y and then the bijection is empty" do
      @b.delete_by_y(@y).should == @x
      @b.size == 0
    end

    it "returns y for delete_by_x x and then the bijection is empty" do
      @b.delete_by_x(@x).should == @y
      @b.size == 0
    end

    context "after deleting (x,y)" do
      before :each do
        @b.delete_by_x @x
      end

      it "bijection is empty" do
        @b.size.should == 0
      end

      it "allows re-adding of (x,y)" do
        @b.add @x, @y
      end

      context "when re-adding (x,y)" do
        before :each do
          @b.add @x, @y
        end

        it "should have size 1" do
          @b.size.should == 1
        end
      end
    end

    context "the inverse" do
      before(:each) do
        @b.inverse!
      end

      it "returns y for get_x" do
        @b.get_x(@x).should == @y
      end

      it "returns x for get_y" do
        @b.get_y(@y).should == @x
      end
    end # context inverse
  end # context one pair added
end
