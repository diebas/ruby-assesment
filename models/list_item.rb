class ListItem
  attr_accessor :item, :quantity

  def initialize(item, quantity)
    @item = item
    @quantity = quantity
  end

  def total_tax
    (item.total_tax * quantity).round(2)
  end

  def total
    (item.total * quantity).round(2)
  end

  def print
    "#{quantity} #{item.name} at #{total}"
  end
end
