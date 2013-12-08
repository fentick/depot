class Cart < ActiveRecord::Base
  # A cart has many associated line items. 
  # "dependent: :destroy"  - The existence of line items is dependent on the existence of the cart.
  # If we destroy a cart, deleting it from the database, 
  # we'll want Rails also to destropy any line items that are associated with that cart.
  has_many :line_items, dependent: :destroy

end
