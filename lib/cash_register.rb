class CashRegister
attr_accessor :discount, :total, :items, :price, :quantity


def initialize(discount = 0)
  @total = 0
  @discount = discount
  @items = []
end

def add_item(item, price, quantity = 1)
  self.total += price * quantity
  quantity.times do
  @items << item
  @price = price
  @quantity = quantity
end
end

def apply_discount
  if self.discount > 0
  self.total -= self.total * (self.discount * 0.01)
  "After the discount, the total comes to $#{self.total.to_i}."
else
  "There is no discount to apply."
end
end



def void_last_transaction
self.total -= (price * quantity)
end

end
