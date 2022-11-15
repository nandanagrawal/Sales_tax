require './applicationmodel.rb'
require './order.rb'
require './item.rb'

c1=Order.new("1","1 book at 12.49
  1 music CD at 14.99
  1 chocolate bar at 0.85")
c1.receipt


c2=Order.new("2","1 imported box of chocolates at 10.00
  1 imported bottle of perfume at 47.50")
c2.receipt

c3=Order.new("3","1 imported bottle of perfume at 27.99
  1 bottle of perfume at 18.99
  1 packet of headache pills at 9.75
  1 box of imported chocolates at 11.25")
  c3.receipt