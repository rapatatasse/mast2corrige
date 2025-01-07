class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :products


  include PgSearch::Model
  pg_search_scope :search_users_all,
    against: [:email],
    using: {
      tsearch: { prefix: true },
    }
end
