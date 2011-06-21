
# @example b = Bijection.new
class Bijection
  VERSION = "0.0.1"

  # @private
  def initialize
    @x = {}
    @y = {}
  end

  # add (x,y) to the bijection set (X,Y)
  # @param x the object associated with y
  # @param y the object associated with x
  # @note x must be unique in X; y must be unique in Y
  # @return self
  def map( x, y )
    self
  end

  # @return [Enumerator] the domain set X
  def domain
    @x.each_key
  end

  # @return [Enumerator] the range set Y
  def range
    @y.each_key
  end

  # swap domain X and range Y of this
  # @return nil
  def inverse!
  end

  # @param y in domain set Y
  # @return the x associated with y
  def get_x( y )
  end

  # @param x in domain set X
  # @return the y associated with x
  def get_y( x )
  end

  # @return [Enumerator] an enumerator all (x,y)
  def each_pair
  end

  # given x, delete (x,y) and return y
  # @param (see #get_x)
  # @example
  #  b = Bijection.new
  #  x = 2 ; y = 3
  #  b.map x, y
  #  y = nil
  #  while 1 { y = b.delete_x x ; b.map x, y }
  # @return the y associated with x
  def delete_x( x )
  end

  # given y, delete (x,y) and return x
  # @param (see #get_y)
  # @return x associated with y
  def delete_y( y )
  end
end
