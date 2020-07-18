class A
  def m1
    34
  end

  def m2 (x, y)
    z = 7
    if x > y
      false
    else
      x + y * z
    end
  end
end

class B
  def m1
    4
  end

  def m3 x
    x.abs * 2 + self.m1
  end

  def m4 x
    if x > 5
      5
    elsif x > 3
      3
    end
  end
end
