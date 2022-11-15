module Calculation
  def exempted_items?(item)
    item.items_name.split.any? { |e| ["book", "chocolate","chocolates", "pill", "pills"].include? e }
  end

  def is_imported?(item)
    item.items_name.include?("imported")
  end

  def sale_taxes(item)
    total_tax=0
    total_tax+=item.items_price*10.0/100 unless exempted_items?(item)
    total_tax+=(item.items_price*5.0/100).ceil(1) if is_imported?(item)
    @total_sale_tax=@total_sale_tax+total_tax
    total_tax
  end

  
end