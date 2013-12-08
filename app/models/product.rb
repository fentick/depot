class Product < ActiveRecord::Base

#t.string :title
#t.text :description
#t.string :image_url
#t.decimal :price, precision: 8, scale: 2

#The field's title, description and image URL are not empty.
  validates :title, :description, :image_url, presence: true

#The price is a valid number not less than $0.01.
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

#The title is unique among all products.
  validates :title, uniqueness: true

#The image URL looks reasonable.
  validates :image_url, allow_blank: true, format: {
  	with: %r{\.(gif|jpg|png)\Z}i,
  	message: 'must be a URL for GIF, JPG or PNG image.'
  }

end
