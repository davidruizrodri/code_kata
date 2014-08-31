require 'spec_helper'
require_relative '../../lib/checkout'

describe "Exercise integration specs" do
  let( :pricing_rules ) {
    {
      a: { price: 50, discount: { quantity: 3, special_price: 130 } },
      b: { price: 30, discount: { quantity: 2, special_price: 45 } },
      c: { price: 20 },
      d: { price: 15 },
    }
  }

  subject { Checkout.new( pricing_rules ) }

  context "when no discount present" do
    it "returns the expected result for the given case" do
      subject.scan( :c )
      expect( subject.total ).to eq 20
    end
    it "returns the expected result for the given case" do
      subject.scan( :c )
      subject.scan( :d )
      expect( subject.total ).to eq 35
    end
    it "returns the expected result for the given case" do
      subject.scan( :c )
      subject.scan( :b )
      expect( subject.total ).to eq 50
    end
  end

  context "when only double discount present" do
    it "returns the expected result for the given case" do
      subject.scan( :b )
      expect( subject.total ).to eq 30
    end
    it "returns the expected result for the given case" do
      subject.scan( :b )
      subject.scan( :b )
      expect( subject.total ).to eq 45
    end
    it "returns the expected result for the given case" do
      subject.scan( :b )
      subject.scan( :b )
      subject.scan( :b )
      expect( subject.total ).to eq 75
    end
  end

  context "when only triple discount present" do
    it "returns the expected result for the given case" do
      subject.scan( :a )
      expect( subject.total ).to eq 50
    end
    it "returns the expected result for the given case" do
      subject.scan( :a )
      subject.scan( :a )
      expect( subject.total ).to eq 100
    end
    it "returns the expected result for the given case" do
      subject.scan( :a )
      subject.scan( :a )
      subject.scan( :a )
      expect( subject.total ).to eq 130
    end
    it "returns the expected result for the given case" do
      subject.scan( :a )
      subject.scan( :a )
      subject.scan( :a )
      subject.scan( :a )
      expect( subject.total ).to eq 180
    end
  end

  context "when mixed behaviours" do
    it "returns the expected result for the given case" do
      subject.scan( :a )
      subject.scan( :a )
      subject.scan( :c )
      subject.scan( :b )
      subject.scan( :b )
      expect( subject.total ).to eq 165
    end
    it "returns the expected result for the given case" do
      subject.scan( :a )
      subject.scan( :a )
      subject.scan( :a )
      subject.scan( :c )
      subject.scan( :c )
      expect( subject.total ).to eq 170
    end
    it "returns the expected result for the given case" do
      subject.scan( :a )
      subject.scan( :a )
      subject.scan( :a )
      subject.scan( :b )
      expect( subject.total ).to eq 160
    end
  end

end