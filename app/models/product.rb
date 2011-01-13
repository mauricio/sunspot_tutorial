class Product < ActiveRecord::Base
  
  belongs_to :category
  
  validates_presence_of :name, :description, :category_id, :price
  validates_uniqueness_of :name, :allow_blank => true
  
  searchable :auto_index => true, :auto_remove => true do
    text :name, :boost => 2.0
    text :description
    float :price
    integer :category_id, :references => ::Category
  end
  
  def to_s
    self.name
  end
  
end