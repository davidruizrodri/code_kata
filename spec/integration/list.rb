require 'spec_helper'

describe List::Base do

  subject { List::Base.new }

  context 'empty list' do
    describe '#find' do
      it 'should not find items' do
        expect( subject.find('fred') ).to be_nil
      end
    end

    describe '#values' do
      it 'should return an empty array' do
        expect( subject.values ).to be_empty
      end
    end
  end

  context 'not empty list' do
    before do
      subject.add('fred')
      subject.add('wilma')
    end

    let(:fred) { subject.find('fred') }
    let(:wilma) { subject.find('wilma') }

    describe '#find' do
      it 'should find fred and wilma' do
        expect( fred.value ).to eq 'fred'
        expect( wilma.value ).to eq 'wilma'
      end

      it 'should not find josh' do
        expect( subject.find('josh') ).to be_nil
      end
    end

    describe '#values' do
      it 'should return an empty array' do
        expect( subject.values ).to eq ['fred', 'wilma']
      end
    end

    describe '#delete' do
      it 'should delete fred' do
        subject.delete(fred)
        expect( subject.values ).to eq ['wilma']
      end

      it 'should delete all nodes from list' do
        subject.delete(fred)
        subject.delete(wilma)
        expect( subject.values ).to eq []
      end
    end
  end

end