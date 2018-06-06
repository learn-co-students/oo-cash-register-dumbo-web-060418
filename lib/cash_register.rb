require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :num_last_items, :last_trans_price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @num_last_items = 0
    @last_trans_price = 0
  end

  def add_item(title, price, quantity=1)
    quantity.times { self.items << title }
    self.num_last_items = quantity
    self.last_trans_price = price * quantity
    self.total += price * quantity
  end

  def apply_discount
    markdown = self.total * self.discount / 100
    self.total -= markdown
    return self.discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{self.total}."
  end

  def void_last_transaction
    self.items.pop(self.num_last_items)
    self.total -= self.last_trans_price
  end

end
