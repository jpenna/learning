# University of Washington,Programming Languages,Homework 7,hw7.rb
# (See also ML code)

# a little language for 2D geometry objects

# each subclass of GeometryExpression,including subclasses of GeometryValue,
#  needs to respond to messages preprocess_prog and eval_prog
#
# each subclass of GeometryValue additionally needs:
#   * shift
#   * intersect,which uses the double-dispatch pattern
#   * intersectPoint,intersectLine,and intersectVerticalLine for
#       for being called by intersect of appropriate clases and doing
#       the correct intersection calculuation
#   * (We would need intersectNoPoints and intersectLineSegment,but these
#      are provided by GeometryValue and should not be overridden.)
#   *  intersectWithSegmentAsLineResult,which is used by
#      intersectLineSegment as described in the assignment
#
# you can define other helper methods,but will not find much need to

# Note: geometry objects should be immutable: assign to fields only during
#       object construction

# Note: For eval_prog,represent environments as arrays of 2-element arrays
# as described in the assignment

class GeometryExpression
  # do *not* change this class definition
  Epsilon = 0.00001
end

class GeometryValue
  # do *not* change methods in this class definition
  # you can add methods if you wish

  private
  # some helper methods that may be generally useful
  def real_close(r1,r2)
    (r1 - r2).abs < GeometryExpression::Epsilon
  end

  def real_close_point(x1,y1,x2,y2)
    real_close(x1,x2) && real_close(y1,y2)
  end

  def two_points_to_line(x1,y1,x2,y2)
    if real_close(x1,x2)
      VerticalLine.new x1
    else
      m = (y2 - y1).to_f / (x2 - x1)
      b = y1 - m * x1
      Line.new(m,b)
    end
  end

  public
  def intersectNoPoints np
    np # could also have NoPoints.new here instead
  end

  def intersectLineSegment seg
    line_result = intersect(two_points_to_line(seg.x1,seg.y1,seg.x2,seg.y2))
    line_result.intersectWithSegmentAsLineResult seg
  end
end

class NoPoints < GeometryValue
  def eval_prog env
    self # all values evaluate to self
  end
  def preprocess_prog
    self # no pre-processing to do here
  end
  def shift(dx,dy)
    self # shifting no-points is no-points
  end
  def intersect other
    other.intersectNoPoints self # will be NoPoints but follow double-dispatch
  end
  def intersectPoint p
    self # intersection with point and no-points is no-points
  end
  def intersectLine line
    self # intersection with line and no-points is no-points
  end
  def intersectVerticalLine vline
    self # intersection with line and no-points is no-points
  end
  # if self is the intersection of (1) some shape s and (2)
  # the line containing seg,then we return the intersection of the
  # shape s and the seg.  seg is an instance of LineSegment
  def intersectWithSegmentAsLineResult seg
    self
  end
end


class Point < GeometryValue
  attr_reader :x,:y
  def initialize(x,y)
    @x = x
    @y = y
  end

  def inbetween?(v,end1,end2)
    return ((end1 - GeometryExpression::Epsilon <= v and v <= end2 + GeometryExpression::Epsilon) or (end2 - GeometryExpression::Epsilon <= v and v <= end1 + GeometryExpression::Epsilon))
  end

  def eval_prog env
    self
  end
  def preprocess_prog
    self
  end
  def shift(dx,dy)
    Point.new(@x+dx,@y+dy)
  end

  def intersect other
    other.intersectPoint self
  end
  def intersectPoint point
    return real_close_point(@x, @y, point.x, point.y) ? self : NoPoints.new
  end
  def intersectLine line
    line.intersectPoint self
  end
  def intersectVerticalLine vline
    vline.intersectPoint self
  end

  def intersectWithSegmentAsLineResult seg
    if (inbetween?(@x,seg.x1,seg.x2) and inbetween?(@y,seg.y1,seg.y2))
      return Point.new(@x,@y)
    end
    return NoPoints.new
  end
end

class Line < GeometryValue
  attr_reader :m,:b
  def initialize(m,b)
    @m = m
    @b = b
  end

  def eval_prog env
    self
  end
  def preprocess_prog
    self
  end
  def shift(dx,dy)
    Line.new(@m, @b+dy - @m*dx)
  end

  def intersect other
    other.intersectLine self
  end
  def intersectPoint point
    lineY = @m * point.x + b
    if real_close(point.y,lineY)
      return point
    end
    return NoPoints.new
  end

  def intersectLine line
    if real_close(@m,line.m)
      if real_close(@b,line.b)
        return self
      end
      return NoPoints.new
    end
    x = (line.b - @b) / (@m - line.m)
    y = @m * x + @b
    return Point.new(x,y)
  end

  def intersectVerticalLine vline
    Point.new(vline.x,@m * vline.x + @b)
  end

  def intersectWithSegmentAsLineResult seg
    seg
  end
end

class VerticalLine < GeometryValue
  attr_reader :x
  def initialize x
    @x = x
  end

  def eval_prog env
    self
  end
  def preprocess_prog
    self
  end
  def shift(dx,dy)
    VerticalLine.new @x + dx
  end

  def intersect other
    other.intersectVerticalLine self
  end
  def intersectPoint point
    if real_close(point.x,@x)
      return point
    end
    return NoPoints.new
  end
  def intersectLine line
    line.intersectVerticalLine self
  end
  def intersectVerticalLine vline
    if real_close(vline.x,@x)
      return self
    end
    return NoPoints.new
  end

  def intersectWithSegmentAsLineResult seg
    seg
  end
end

class LineSegment < GeometryValue
  # Note: This is the most difficult class.  In the sample solution,
  #  preprocess_prog is about 15 lines long and
  # intersectWithSegmentAsLineResult is about 40 lines long
  attr_reader :x1,:y1,:x2,:y2
  def initialize (x1,y1,x2,y2)
    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2
  end

  def eval_prog env
    self
  end
  def preprocess_prog
    invert = false
    if real_close(@x1,@x2)
      if real_close(@y1,@y2)
        return Point.new(@x1,@y1)
      elsif @y1 > @y2
        invert = true
      end
    elsif @x1 > @x2
      invert = true
    end
    return invert ? LineSegment.new(@x2,@y2,@x1,@y1) : self
  end
  def shift(dx,dy)
    LineSegment.new(@x1+dx, @y1+dy, @x2+dx, @y2+dy).preprocess_prog
  end

  def intersect other
    other.intersectLineSegment self
  end
  def intersectPoint point
    point.intersectLineSegment self
  end
  def intersectLine line
    line.intersectLineSegment self
  end
  def intersectVerticalLine vline
    vline.intersectLineSegment self
  end

  def intersectWithSegmentAsLineResult seg
    if real_close(@x1,@x2)
      if @y1 < seg.y1
      then
        first = self
        second = seg
      else
        first = seg
        second = self
      end

      aXstart = first.x1
      aYstart = first.y1
      aXend = first.x2
      aYend = first.y2

      bXstart = second.x1
      bYstart = second.y1
      bXend = second.x2
      bYend = second.y2

      if real_close(aYend,bYstart)
        return Point.new(aXend,aYend)
      elsif aYend < bYstart
        return NoPoints.new
      elsif aYend > bYend
        return LineSegment.new(bXstart,bYstart,bXend,bYend)
      else
        return LineSegment.new(bXstart,bYstart,aXend,aYend)
      end

    else
      if @x1 < seg.x2
      then
        first = self
        second = seg
      else
        first = seg
        second = self
      end

      aXstart = first.x1
      aYstart = first.y1
      aXend = first.x2
      aYend = first.y2

      bXstart = second.x1
      bYstart = second.y1
      bXend = second.x2
      bYend = second.y2

      if real_close(aXend,bXstart)
        return Point.new(aXend,aYend)
      elsif aXend < bXstart
        return NoPoints.new
      elsif aXend > bXend
        return LineSegment.new(bXstart,bYstart,bXend,bYend)
      else
        return LineSegment.new(bXstart,bYstart,aXend,aYend)
      end
    end
  end
end

##### Geometry Expressions #####

class Intersect < GeometryExpression
  def initialize(e1,e2)
    @e1 = e1
    @e2 = e2
  end

  def eval_prog env
    (@e1.eval_prog env).intersect(@e2.eval_prog env)
  end
  def preprocess_prog
    Intersect.new(@e1.preprocess_prog(),@e2.preprocess_prog())
  end
end

class Let < GeometryExpression
  def initialize(s,e1,e2)
    @s = s
    @e1 = e1
    @e2 = e2
  end

  def eval_prog env
    nextEnv = [[@s, @e1.eval_prog(env)]].concat(Array.new env)
    @e2.eval_prog nextEnv
  end
  def preprocess_prog
    Let.new(@s, @e1.preprocess_prog, @e2.preprocess_prog)
  end
end

class Var < GeometryExpression
  def initialize s
    @s = s
  end
  def eval_prog env # remember: do not change this method
    pr = env.assoc @s
    raise "undefined variable #{@s}" if pr.nil?
    pr[1]
  end
  def preprocess_prog
    self
  end
end

class Shift < GeometryExpression
  def initialize(dx,dy,e)
    @dx = dx
    @dy = dy
    @e = e
  end

  def eval_prog env
    (@e.eval_prog env).shift(@dx,@dy)
  end

  def preprocess_prog
    Shift.new(@dx,@dy,@e.preprocess_prog())
  end
end
