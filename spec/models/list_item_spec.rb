require 'rspec'
require 'byebug'
require_relative '../../models/list_item'

RSpec.describe ListItem do
  let(:book) { Item.new("book", 12.49, false, false) }
  let(:music_cd) { Item.new("music CD", 14.99, true, true) }
  let(:chocolate_bar) { Item.new("imported chocolate bar", 0.85, false, true) }

  describe "#total_tax" do
    it "returns the total_tax for the quantity of the item" do
      list_item = ListItem.new(book, 2)
      expect(list_item.total_tax).to eq(0)
      list_item = ListItem.new(music_cd, 1)
      expect(list_item.total_tax).to eq(2.25)
      list_item = ListItem.new(chocolate_bar, 3)
      expect(list_item.total_tax).to eq(0.15)
    end
  end

  describe "#total" do
    it "returns the total price for the quantity of the item" do
      list_item = ListItem.new(book, 1)
      expect(list_item.total).to eq(12.49)
      list_item = ListItem.new(music_cd, 2)
      expect(list_item.total).to eq(34.48)
      list_item = ListItem.new(chocolate_bar, 3)
      expect(list_item.total).to eq(2.7)
    end
  end
end
