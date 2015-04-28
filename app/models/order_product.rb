class OrderProduct < ActiveRecord::Base
  
  #Associations
  belongs_to :order
  belongs_to :product
  
  delegate :title, to: :product, allow_nil: true, prefix: true
  delegate :img_path, to: :product, allow_nil: true, prefix: true
end
