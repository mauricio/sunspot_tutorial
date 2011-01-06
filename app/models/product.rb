class Product < ActiveRecord::Base
  
  belongs_to :category
  
  validates_presence_of :name, :description, :category_id, :price
  validates_uniqueness_of :name, :allow_blank => true
  
  def to_s
    self.name
  end
  
end