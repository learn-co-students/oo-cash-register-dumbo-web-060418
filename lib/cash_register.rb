require 'pry'

class CashRegister
	attr_accessor :discount, :total, :items
	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(title, price, quantity=0)
		prev_total = @total
		if quantity >=1
			quantity.times do
				@items << title
			end
		else
			@items << title
		end
		quantity >= 1 ? @total += (price * quantity) : @total += price
	end

	def apply_discount
		if discount >= 1
		@total = @total - @total * @discount / 100
		"After the discount, the total comes to $#{@total}."
		else
		"There is no discount to apply."
		end
	end

	def items
		@items
	end

	def void_last_transaction
		@total = 0
	end
##binding.pry
end
