class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true 
	validates :title, uniqueness: true,
			  length: { minimum: 10, message: "must be at least ten characters long."}
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :image_url, allow_blank: true, 
				format: { with: %r{\.(gif|jpg|png)\Z}i, 
						  message: 'must be a URL for GIF, JPG, PNG image.' }
	#Returns the most recent updated record
	def self.latest
		Product.order(:updated_at).last
	end 
end