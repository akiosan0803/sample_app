class Change < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image_url, :text
    add_column :products,:description,:text
  end
end
