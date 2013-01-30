require 'helper'

describe "Constants" do
  it "should have defined constants" do
    assert_equal 1/0.0, Infinity
    assert defined?(NaN)
  end

end
