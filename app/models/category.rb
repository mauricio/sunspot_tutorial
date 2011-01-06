class Category < ActiveRecord::Base
  
  has_many :products
  
  validates_presence_of :name
  validates_uniqueness_of :name, :allow_blank => true
  
  def to_s
    self.name
  end
  
end