class Film < ApplicationRecord
  belongs_to :category
  has_many :reviews

  has_attached_file :film_img, styles: { film_index: "250x350>", film_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :film_img, content_type: /\Aimage\/.*\z/
end
