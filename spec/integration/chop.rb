require 'spec_helper'

describe Chop::Base do
  subject { Chop::Base }

  context 'with an empty sorted array' do
    it 'indicates item not found' do
      expect( subject.recursive_find(1, []) ).to be -1
      expect( subject.iterative_find(1, []) ).to be -1
    end
  end

  context 'with search target in the middle of the array' do
    it 'provides the index of the located item' do
      expect( subject.recursive_find(20, [5, 10, 20, 30, 50]) ).to be 2
      expect( subject.iterative_find(20, [5, 10, 20, 30, 50]) ).to be 2
    end
  end

  context 'with search target as first item in the array' do
    it 'provides an index of 0' do
      expect( subject.recursive_find(20, [20, 30, 40, 50, 60]) ).to be 0
      expect( subject.iterative_find(20, [20, 30, 40, 50, 60]) ).to be 0
    end
  end

  context 'with search target as last item in the array' do
    it 'provides an index for the last item' do
      expect( subject.recursive_find(20, [5, 10, 15, 20]) ).to be 3
      expect( subject.iterative_find(20, [5, 10, 15, 20]) ).to be 3
    end
  end

  context 'with search target not in the array' do
    it 'indicates item not found' do
      expect( subject.recursive_find(20, [5, 15, 45, 135]) ).to be -1
      expect( subject.iterative_find(20, [5, 15, 45, 135]) ).to be -1
    end
  end

  context 'with a large array and a locatable search target' do
    it 'provides the index of the found item' do
      large_array = Array(0..900)
      expect( subject.recursive_find(100, large_array) ).to be 100
      expect( subject.iterative_find(100, large_array) ).to be 100
    end
  end
end