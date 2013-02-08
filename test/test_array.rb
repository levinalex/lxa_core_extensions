require 'helper'

describe "Array#only" do
  it "should raise on multi element arrays" do
    assert_raises(RuntimeError) do
      [1,2,3].only
    end

    assert_raises(RuntimeError) do
      [].only
    end
  end

  it "should return first element" do
    assert_equal(12, [12].only)
  end

  it "should return a random element" do
    arr = [:a,:b,:c,:d]
    assert_includes arr, arr.random_element
  end

end
