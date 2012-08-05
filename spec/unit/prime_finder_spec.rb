require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PrimeFinder do
  
  it "should generate the first 20 naturals" do
    PrimeFinder.first_n_naturals(20).should eql([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
  end
  
  it "should start from 2" do
    PrimeFinder.find(2,2).should eql([2])
  end
  
  it "should remove all elements from the time table of 2" do
    PrimeFinder.find(3,6).should eql([2,3,5])
  end
  
  it "should generate time tables stretching until a certain number" do
    PrimeFinder.timestable(2,27).should eql([2,4,6,8,10,12,14,16,18,20,22,24,26])
  end
  
  it "should find the first 10 and just the first 10 prime elements" do
    PrimeFinder.find(10,500).should eql([2,3,5,7,11,13,17,19,23,29])
  end
  
end