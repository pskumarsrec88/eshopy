class Product < ActiveRecord::Base
  
  #Associations
  has_many :order_products
  has_many :orders, through: :order_products
  
  #Validations
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates :price, :numericality => { :greater_than => 0 }
  
  attr_accessor :img_path
  
  #scope for active products
  scope :active, -> { where('active =?', true) }
  
  PATH = ['product1.jpg','product2.jpg','product3.jpg','product4.jpg','product5.jpg']
  
  #Create product image URL
  before_create :default_url
  
  def default_url
    self.url = PATH[rand(5)]
  end
  
  def img_path
    "/products/" + self.url
  end
  
end