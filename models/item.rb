# frozen_string_literal: true

class Item
  attr_accessor :name, :price, :pays_basic_tax, :imported

  def initialize(name, price, pays_basic_tax, imported)
    @name = name
    @price = price
    @pays_basic_tax = pays_basic_tax
    @imported = imported
  end

  def basic_tax
    pays_basic_tax ? price * 0.1 : 0
  end

  def import_tax
    imported ? price * 0.05 : 0
  end

  def total_tax
    total_tax = basic_tax + import_tax
    rounded_tax = (total_tax / 0.05).ceil * 0.05
    rounded_tax.round(2)
  end

  def total
    (price + total_tax).round(2)
  end
end
