class AddAttachmentFilmImgToFilms < ActiveRecord::Migration[7.0]
  def up
    add_column :films, :film_img_file_name, :string
    add_column :films, :film_img_file_size, :integer
    add_column :films, :film_img_content_type, :string
    add_column :films, :film_img_updated_at, :datetime
 end

 def down
    remove_column :films, :film_img_file_name, :string
    remove_column :films, :film_img_file_size, :integer
    remove_column :films, :film_img_content_type, :string
    remove_column :films, :film_img_updated_at, :datetime
 end
end
