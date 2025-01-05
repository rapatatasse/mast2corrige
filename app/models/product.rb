class Product < ApplicationRecord
  belongs_to :user

  validates :name,  :price, :quantity, presence: true



  include PgSearch::Model
  pg_search_scope :search_products_all,
    against: [:name, :description, :price],
    associated_against: {
      user: [:email],
    },
    using: {
      tsearch: { prefix: true },
    }
end
