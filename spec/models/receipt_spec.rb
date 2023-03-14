require 'rspec'
require 'byebug'
require_relative '../../models/receipt'
require_relative '../../models/list_item'
require_relative '../../models/item'

RSpec.describe Receipt do
  describe '#print_receipt' do
    context 'input 1' do
      let!(:book) { Item.new('book', 12.49, false, false) }
      let!(:music_cd) { Item.new('music CD', 14.99, true, false) }
      let!(:chocolate_bar) { Item.new('chocolate bar', 0.85, false, false) }

      let!(:book_list_item) { ListItem.new(book, 2) }
      let!(:music_cd_list_item) { ListItem.new(music_cd, 1) }
      let!(:chocolate_bar_list_item) { ListItem.new(chocolate_bar, 1) }

      let(:receipt) { Receipt.new() }

      before do
        receipt.add_list_item(book_list_item)
        receipt.add_list_item(music_cd_list_item)
        receipt.add_list_item(chocolate_bar_list_item)
      end

      it 'returns the correct values' do
        expect{ receipt.print_receipt }.to output(
          <<~OUTPUT
            2 book: 24.98
            1 music CD: 16.49
            1 chocolate bar: 0.85
            Sales Taxes: 1.50
            Total: 42.32
          OUTPUT
        ).to_stdout
      end
    end

    context 'input 2' do
      let!(:chocolate_box) { Item.new('imported box of chocolates', 10.00, false, true) }
      let!(:perfume_bottle) { Item.new('imported bottle of perfume', 47.50, true, true) }

      let!(:chocolate_box_list_item) { ListItem.new(chocolate_box, 1) }
      let!(:perfume_bottle_list_item) { ListItem.new(perfume_bottle, 1) }

      let(:receipt) { Receipt.new() }

      before do
        receipt.add_list_item(chocolate_box_list_item)
        receipt.add_list_item(perfume_bottle_list_item)
      end

      it 'returns the correct values' do
        expect{ receipt.print_receipt }.to output(
          <<~OUTPUT
            1 imported box of chocolates: 10.50
            1 imported bottle of perfume: 54.65
            Sales Taxes: 7.65
            Total: 65.15
          OUTPUT
        ).to_stdout
      end
    end

    context 'input 2' do
      let!(:imported_perfume_bottle) { Item.new('imported bottle of perfume', 27.99, true, true) }
      let!(:perfume_bottle) { Item.new('bottle of perfume', 18.99, true, false) }
      let!(:headache_pills) { Item.new('packet of headache pills', 9.75, false, false) }
      let!(:chocolate_box) { Item.new('imported boxes of chocolates', 11.25, false, true) }

      let!(:imported_perfume_bottle_list_item) { ListItem.new(imported_perfume_bottle, 1) }
      let!(:perfume_bottle_list_item) { ListItem.new(perfume_bottle, 1) }
      let!(:headache_pills_list_item) { ListItem.new(headache_pills, 1) }
      let!(:chocolate_box_list_item) { ListItem.new(chocolate_box, 3) }

      let(:receipt) { Receipt.new() }

      before do
        receipt.add_list_item(imported_perfume_bottle_list_item)
        receipt.add_list_item(perfume_bottle_list_item)
        receipt.add_list_item(headache_pills_list_item)
        receipt.add_list_item(chocolate_box_list_item)
      end

      it 'returns the correct values' do
        expect{ receipt.print_receipt }.to output(
          <<~OUTPUT
            1 imported bottle of perfume: 32.19
            1 bottle of perfume: 20.89
            1 packet of headache pills: 9.75
            3 imported boxes of chocolates: 35.55
            Sales Taxes: 7.90
            Total: 98.38
          OUTPUT
        ).to_stdout
      end
    end
  end
end
