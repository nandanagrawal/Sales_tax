require './applicationmodel.rb'
require './item.rb'
require './calculation.rb'

class Order < ApplicationModel
  has_many :items
  include Calculation

  attr_accessor :id, :items_list, :sum_price, :total_sale_tax
  def initialize(id,items_list)
    @id=id
    @items_list=items_list
    @sum_price=0
    @total_sale_tax=0
    # items_arr.each_with_index do |value,index|
    #   items_arr[index]=value.strip
    # end
    
    items_list.split("\n").map { |i| i.strip }.each do |value| Item.new(id, value) end
    # items_arr.each do|value|
    #   Item.new(id, value)
    # end
  end

  def total_price(item)
    @sum_price+=item.items_price
    item.items_price+sale_taxes(item)
  end

  def receipt
    self.items.each_with_index do |item,i|
       puts "#{item.quantity} #{item.items_name}: #{sprintf("%.2f",total_price(item).round(2))}"     ##{(total_price(item)).round(2)}
    end
    puts "Sales Taxes : #{sprintf("%.2f",((@total_sale_tax*20).round(2)/20.0).round(2))}"
    puts "Total : #{(@sum_price+@total_sale_tax).round(2)}"
    puts "\n"
  end

end