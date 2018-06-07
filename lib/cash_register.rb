class CashRegister

  attr_accessor :total, :discount, :items, :prices, :number

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
    @number = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @total += (price * quantity)
    quantity.times do
      @items << title
    end
    @prices << price
    @number << quantity
  end

  def apply_discount
    if @discount > 0
       @total = @total - (@total * @discount/100)
       "After the discount, the total comes to $#{@total}."
    else
       "There is no discount to apply."
    end
  end

  def items
     @items
  end

  def void_last_transaction
     last_price = @prices.pop
     last_quantity = @number.pop
     @total = (@total - (last_price * last_quantity))
     @total
  end

end
