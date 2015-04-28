class Cart < ActiveRecord::Base
  #Associations
  belongs_to :product
  
  #Validations
  validates_presence_of :quantity
  validates :quantity, :numericality => { :greater_than => 0 }
  
  attr_accessor :product_image
  
  #scope for active products
  scope :created_between, -> (start_date, end_date  = 0) { where("DATE(created_at) >= ? AND DATE(created_at) <= ?", start_date  - end_date.days, start_date )}
  
  delegate :title, to: :product, allow_nil: true, prefix: true
  delegate :img_path, to: :product, allow_nil: true, prefix: true
  
  #Create product image URL
  before_save :calculate_price
  
  def calculate_price
    self.price = product.price
    self.value = self.quantity * self.price
  end
  
  def order_status
    status ? "Fulfilled" : "UnFulfilled"
  end
end
