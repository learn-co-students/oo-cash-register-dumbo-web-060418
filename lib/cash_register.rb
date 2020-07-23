
require 'pry'
class CashRegister

attr_accessor :total , :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = nil

  end

  def add_item(title, price, quantity = 1)
    item = title
    self.last_transaction = price * quantity
    self.total += self.last_transaction

    quantity.times do
      @items << item

    end
  end

  def apply_discount
    markdown = self.total * (self.discount.to_f/100.to_f)
    new_total = 0
    if self.discount == 0
      "There is no discount to apply."
    elsif self.discount > 0
      self.total = self.total - markdown
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -=  self.last_transaction

  end



end
