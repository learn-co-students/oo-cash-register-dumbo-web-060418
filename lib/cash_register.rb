require "pry"

class CashRegister

attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0)
    @total=0
    @discount=discount
    @items = []
    @last_transaction = 0.0
  end

  def add_item(title, price, quantity=1)
      self.last_transaction = 0
      quantity.times do
      self.items << title
    end
    self.total += quantity * price
    self.last_transaction = quantity * price
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      percentage = discount.to_f / 100.to_f
      subtract_this = self.total * percentage
      self.total = self.total - subtract_this
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end
