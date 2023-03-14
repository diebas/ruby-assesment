# frozen_string_literal: true

require 'rspec'
require 'byebug'
require_relative '../../models/item'

RSpec.describe Item do
  subject(:item) { Item.new('Item', price, pays_basic_tax, imported) }

  let(:price) { 20 }
  let(:imported) { true }
  let(:pays_basic_tax) { true }

  describe '#basic_tax' do
    context 'when the item is not exempt of basic sales tax' do
      it "returns 10% of the item's price" do
        expect(item.basic_tax).to eq(2)
      end
    end

    context 'when the item is exempt of basic sales tax' do
      let(:pays_basic_tax) { false }

      it { expect(item.basic_tax).to eq(0) }
    end
  end

  describe '#import_tax' do
    context 'when the item is imported' do
      it "returns 5% of the item's price" do
        expect(item.import_tax).to eq(1)
      end
    end

    context 'when the item is not imported' do
      let(:imported) { false }

      it { expect(item.import_tax).to eq(0) }
    end
  end

  describe '#total_tax' do
    context 'when the item is imported and not exempt of basic sales tax' do
      it 'returns the sum of both taxes' do
        expect(item.total_tax).to eq(3)
      end
    end

    context 'when the item is not imported and excempt of basic sales tax' do
      let(:imported) { false }
      let(:pays_basic_tax) { false }

      it { expect(item.import_tax).to eq(0) }
    end
  end

  describe '#total' do
    it 'returns the sum of price and total taxes' do
      expect(item.total).to eq(23)
    end
  end
end
