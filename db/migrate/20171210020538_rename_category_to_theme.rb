class RenameCategoryToTheme < ActiveRecord::Migration[5.0]
  def up
    remove_index :games, :category_id
    remove_column :games, :category_id
    rename_table :categories, :themes
    add_reference :games, :theme, index: true
  end

  def down
    remove_index :games, :theme_id
    remove_column :games, :theme_id
    rename_table :themes, :categories
    add_reference :games, :category, index: true
  end
end
