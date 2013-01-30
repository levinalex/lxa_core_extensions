require 'helper'

describe "Hash#flip" do
  it "should work" do
    assert_equal({2=>[1, 6], 4=>[3, 7], 6=>[5]},
      {1=>2, 3=>4, 5=>6, 6=>2, 7=>4}.flip)
  end
end


describe "Hash#compact" do
  it "should compact without block" do
     assert_equal({4=>35, 10=>false},
       { 4=>35, 9=>nil, 10=>false }.compact)
  end

  it "should compact with block" do
    assert_equal({9=>[1]},
      { 4=>[], 9=>[1], 10=>{} }.compact(&:empty?))
  end
end

describe "Hash#rekey" do
  it "should work" do
    assert_equal({"1"=>2,"3"=>4, "5"=>{"6"=>7, "8"=>9}},
      {1=>2, 3=>4, 5=>{6=>7, 8=>9}}.rekey(&:to_s))
  end
end


describe "Hash#nested_keys" do
  it "should work" do
    assert_equal([1,3,5,6,8,9],
      {1=>2, 3=>4, 5=>{6=>7, 8=> {9=>10}}}.nested_keys.to_a)
  end

end

