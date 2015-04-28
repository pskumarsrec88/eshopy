class Order < ActiveRecord::Base
    
  #Associations
  has_many :order_products
  has_many :products, through: :order_products

  #scope for active products
  scope :fulfilled, -> { where('status =?', true) }
  scope :unfulfilled, -> { where('status =?', false) }
  scope :created_between, -> (start_date, end_date  = 0) { where("DATE(created_at) >= ? AND DATE(created_at) <= ?", start_date  - end_date.days, start_date )}
  
  def order_status
    status ? "Fulfilled" : "UnFulfilled"
  end
  
end
