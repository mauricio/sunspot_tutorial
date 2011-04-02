class AddIndexToNameOnProducts < ActiveRecord::Migration
  def self.up
    add_index :products, :name
  end

  def self.down
    remove_index :products, :name
  end
end
