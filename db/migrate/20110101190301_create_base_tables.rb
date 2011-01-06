class CreateBaseTables < ActiveRecord::Migration

  def self.up
    
    create_table :categories do |t|
      t.string :name, :null => false
    end
    
    create_table :products do |t|
      t.string  :name, :null => false
      t.decimal :price, :scale => 2, :precision => 16, :null => false
      t.text    :description
      t.integer :category_id, :null => false
    end
  
    add_index :products, :category_id
    
  end

  def self.down
    drop_table :categories
    drop_table :products
  end
  
end
