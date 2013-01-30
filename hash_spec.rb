require 'spec_helper'

describe "Hash#flip" do
  it "should work" do
    {1=>2, 3=>4, 5=>6, 6=>2, 7=>4}.flip.should == {2=>[1, 6], 4=>[3, 7], 6=>[5]}
  end
end


describe "Hash#compact" do
  it "should compact without block" do
     { 4=>35, 9=>nil, 10=>false }.compact.should == {4=>35, 10=>false}
  end

  it "should compact with block" do
    { 4=>35, 9=>nil, 10=>false }.compact(&:blank?).should == {4=>35}
  end
end

describe "Hash#rekey" do
  it "should work" do
    {1=>2, 3=>4, 5=>{6=>7, 8=>9}}.rekey(&:to_s).should == {"1"=>2,"3"=>4, "5"=>{"6"=>7, "8"=>9}}
  end
end


describe "Hash#nested_keys" do
  it "should work" do
    {1=>2, 3=>4, 5=>{6=>7, 8=> {9=>10}}}.nested_keys.to_a.should == [1,3,5,6,8,9]
  end

end

