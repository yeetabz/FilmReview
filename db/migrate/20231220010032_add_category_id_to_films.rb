class AddCategoryIdToFilms < ActiveRecord::Migration[7.0]
  def change
    add_column :films, :category_id, :integer
  end
end
