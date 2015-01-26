#INSTANCE METHODS
#Any instance of the class can call them...
#what methods will need to be shared by every instance of this object?

#we want our receipt to do the following
#1) calculate subtotal
#2) print item name

#
class Receipt
  attr_accessor :shopping_cart

  def initialize(shopping_cart, state)
    @shopping_cart = shopping_cart
    @state = state
  end

  def prices
     prices = {
      "Bread" => 3.29,
      "Apple" => 4.05,
      "Pants" => 19.99,
    }
  end

  def tax
    tax_rates = {
      "ND" => 0.0655,
      "KS" => 0.0815,
      "TX" => 0.0815,
      "OK" => 0.0872,
      "MO" => 0.0758,
      "NM" => 0.0726,
      "ME" => 0.0505,
      "ID" => 0.0603,
    }
    if tax_rates.include?("#{@state}")
      sales_tax = self.subtotal * tax_rates[@state]
      sales_tax.round(2)
    else
    end
  end

  def subtotal
    pricelist = self.prices
    acc = []
    @shopping_cart.each_key do |item|
      pricelist.each_key do |key|
        if item == key
          x = item
          cart = self.shopping_cart
          item_qty_str = cart[item]
          item_qty = item_qty_str.to_i
          acc << item_qty * pricelist[key]
        end
      end
    end
    acc.map! {|v| v.round(2)}
    acc.inject{|sum,x| sum+=x}
  end

  def total
    total = self.subtotal + self.tax
  end

 def item_lines
    cart = self.shopping_cart
    pricelist = self.prices
    str = []
    @shopping_cart.each_key do |item|
      pricelist.each_key do |key|
        if item == key
          item_qty_str = cart[item]
          item_qty = item_qty_str.to_i
          str << "     #{item_qty}     #{item}            #{pricelist[key]} \n"
        end
      end
    end
    puts str.flatten
  end

  def print
    puts
    puts "              RECEIPT"
    puts "         (from some store)"
    puts
    puts
    puts "    QTY    ITEM             PRICE"
    puts
    puts  "       #{self.item_lines}"
    puts
    puts "               Subtotal   #{self.subtotal}"
    puts "               Tax        #{self.tax}"
    puts "               Total      #{self.total}"
    puts
  end
end

example = Receipt.new(Hash["Bread", "2", "Apple", "1", "Pants", "9"], "ID")
example.print

