class Array
  def only
    raise "called Array#only with array of length #{length}" if length != 1
    first
  end

  def random_element
    sample
  end
end
