Class Item
  attr_accessor :name, :price, :pay_basic_tax, :imported, :quantity

  def Initialize(name, price, pays_basic_tax, imported, quantity)
    @name = name
    @price = price
    @pay_basic_tax = pay_basic_tax
    @imported = imported
    @quantity = quantity
  end

  def basic_tax 
    pays_basic_tax ? price * 0.1 : 0
  end

  def import_tax
    imported ? price * 0.05 : 0
  end

  def total_tax
    basic_tax + import_tax
  end

  def total
    price + total_tax
  end
end
