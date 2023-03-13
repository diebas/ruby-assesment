class ListItem
  attr_accessor :item, :quantity

  def initialize(item, quantity)
    @item = item
    @quantity = quantity
  end

  def toal_tax
    item.total_tax * quantity
  end

  def total
    item.total * quantity
  end
end
