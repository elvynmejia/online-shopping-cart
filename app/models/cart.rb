class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	#Checks whether our list of items already includes the product we're adding
  #If so increment quantity by 1 
  #Else build a new item
  def add_product product_id
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id)
    end 
    current_item
  end 

  #Returns the sum of each item in the collection
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end 
end
