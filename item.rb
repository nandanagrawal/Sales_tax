require './applicationmodel.rb'
require './order.rb'


class Item < ApplicationModel
  attr_accessor :order_id ,:items_list,:quantity,:items_name,:items_price,:sale_taxes
  
  def initialize(order_id,items_list)
    @order_id=order_id
    @items_list=items_list
    @quantity=items_list.slice(0).to_i
    @items_name=items_list.split(" ")[1..-3].join(",").gsub(","," ")
    @items_price=items_list.split(" ").last().to_f

   end


end
