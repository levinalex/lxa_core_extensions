require 'helper'

describe "Enumerable#build_hash" do
  it "should return correct things" do
    assert_equal({1=>2, 3=>4, 5=>6},
                 [[1,2],[3,4],[5,6]].build_hash)

    assert_equal({2=>[1,2], 4=>[3,4],6=>[5,6]},
                 [[1,2],[3,4],[5,6]].build_hash(:last))

    assert_equal({1=>1, 2=>2, 3=>3},
                 [1,2,3].build_hash { |h,k| h[k] = k })
  end

  it "should raise an exception when called with symbol and block" do
    assert_raises(ArgumentError) do
      [].build_hash(:last) { |s,v| "#{v}x" }
    end
  end
end

describe "Enumerable#tally" do
  it "should count items" do
    assert_equal([[4,4], [3,"3"], [1,"one"]],
                 [4,4,4,4,"3","3","3","one"].tally)

  end
end

