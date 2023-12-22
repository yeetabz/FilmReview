class AddFilmIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :film_id, :integer
  end
end
