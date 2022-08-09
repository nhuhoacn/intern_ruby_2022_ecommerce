class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parent_id
      t.string :parent_path

      t.timestamps
    end
  end
end
