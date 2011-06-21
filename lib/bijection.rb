
# Bijection is a container similar to a Hash with unique values.
# {http://en.wikipedia.org/wiki/Bijection}
#
# Bijection associates each non-nil unique x in a set X, with a non-nil unique y in a set Y.
#
# @example
#  b = Bijection.new
#  b.add 5, 7 # associates 5 in X with 7 in Y
#  b.size
#   => 1
#  b.add 5, 2 # raises, 5 already in X
#  b.add "foo", 7 # raises, 7 already in Y
#  b.add "bar", 5 # OK; 5 was not yet in Y
#  b.size
#   => 2
#  b.domain.each { |x| puts x }
#   => 5
#   => "bar"
#  b.range.each { |y| puts y }
#   => 7
#   => 5 # i.e., not the "same" 5 that's in X
#  b.each_pair { |x,y| .. }
#  x = b.get_x 7 # x == 5
#  y = b.get_y 5 # y == 7
#  is_nil = b.get_x "returns nil if not found" # is_nil == nil
#  b.inverse! # X and Y are now swapped; all as above with x and y swapped
class Bijection
  VERSION = "0.0.1"

  def initialize
    @X = {} # @X[x] -> y
    @Y = {} # @Y[y] -> x
  end

  # returns the number of pairs in the bijection
  # @return [Fixnum]
  def size
    @X.size
  end

  # add (x,y) to the bijection set (X,Y)
  # @param x the non-nil object associated with y
  # @param y the non-nil object associated with x
  # @note x must be unique in X; y must be unique in Y
  # @return [self]
  def add( x, y )
    raise "Bijection: x may not be nil" if x == nil
    raise "Bijection: y may not be nil" if y == nil
    raise "Bijection: x:#{x.to_s} already present in X" if @X.key? x
    raise "Bijection: y:#{y.to_s} already present in Y" if @Y.key? y
    @X[x] = y
    @Y[y] = x
    self
  end

  # @return [Enumerator] the domain set X
  def domain
    @X.each_key
  end

  # @return [Enumerator] the range set Y
  def range
    @Y.each_key
  end

  # swap domain X and range Y of this
  # @return [nil]
  def inverse!
    temp = @X
    @X = @Y
    @Y = temp
    nil
  end

  # get the x associated with y
  # @param y in domain set Y
  # @return the x associated with y, or nil if y not in range Y
  def get_x( y )
    @Y[y]
  end

  # get the y associated with x
  # @param x in domain set X
  # @return the y associated with x, or nil if x not in domain X
  def get_y( x )
    @X[x]
  end

  # @return [Enumerator] an enumerator all (x,y)
  def each_pair
    @X.each_pair
  end

  # given x, delete (x,y) and return y
  # @param (see #get_x)
  # @example
  #  b = Bijection.new
  #  x = 2 ; y = 3
  #  b.add x, y
  #  y = nil
  #  while true do y = b.delete_by_x x ; b.add x, y end
  # @return (see #get_x)
  def delete_by_x( x )
    y = @X[x]
    @X.delete x
    @Y.delete y
    y
  end

  # given y, delete (x,y) and return x
  # @param (see #get_y)
  # @return (see #get_y)
  # see example #delete_by_x
  def delete_by_y( y )
    x = @Y[y]
    @Y.delete y
    @X.delete x
    x
  end
end
