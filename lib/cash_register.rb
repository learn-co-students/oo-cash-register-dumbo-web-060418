require 'pry'

class CashRegister
  attr_accessor :total, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(title, price, quantity=0)
    if quantity > 0
      @total += (price * quantity)
      quantity.times do
        @items << title
        @transactions << price
      end
    else
      @total += price
      @items << title
      @transactions << price
    end
  end

  def items
    @items
  end

  def apply_discount
    if discount > 0
      disc = (1-(@discount/100.0))
      @total *= disc
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @transactions[-1]
  end

end
