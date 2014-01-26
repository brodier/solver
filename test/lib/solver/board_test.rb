require_relative '../../test_helper'

describe Solver::Board do
  subject { 
    Solver::Board.new(4,5)
  }
  
  it "must respond to add and handle it without error" do
    subject.must_respond_to(:add)
  end
  
  it "must respond to possible_moves" do
    subject.must_respond_to(:possible_moves)
  end  
  
  it "testing one game" do
    subject.add(0,0,2,2)
    subject.add(3,0,1,1)
    subject.add(3,1,1,1)
    subject.add(1,2,1,1)
    subject.add(1,3,1,1)
    subject.add(0,2,1,2)
    subject.add(2,3,1,2)
    subject.add(3,3,1,2)
    subject.add(2,2,2,1)
    subject.add(0,4,2,1)
    subject.nb_pieces.must_equal(10)
    subject.possible_moves.
      must_equal({ 0 =>[:rigth], 1 => [:left], 2 => [:left]})
  end
end

