class Cart < ActiveRecord::Base
  # A cart has many associated line items. 
  # "dependent: :destroy"  - The existence of line items is dependent on the existence of the cart.
  # If we destroy a cart, deleting it from the database, 
  # we'll want Rails also to destropy any line items that are associated with that cart.
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
  	current_item = line_items.find_by(product_id: product_id)
  	if current_item
  	  current_item.quantity += 1
  	else
  	  current_item = line_items.build(product_id: product_id)
  	end
  	current_item
  end
end
