class Receipt
  attr_accessor :list_items

  def initialize
    @list_items = []
  end

  def add_list_item(list_item)
    list_items << list_item
  end

  def sales_tax
    list_items.sum(&:tax)
  end

  def total
    list_items.sum(&:total)
  end
end
