
class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=0)

    if quantity > 0
      self.total += price * quantity
      quantity.times do
        items << title
      end
    else
      self.total += price
      @items << title
    end
  end

  #@total AND self.total BOTH work ........ ??

  def apply_discount
    if @discount > 0
      @total = @total - @total * @discount / 100.00
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @total
  end

end
