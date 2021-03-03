class User < ApplicationRecord
    has_secure_password
  
    validates :username, uniqueness: true, presence: true, length: { in: 3..200 }
    validates :firstname, presence: true, length: { in: 2...200 }
    validates :lastname, presence: true, length: { in: 2...200 }
    validates :email, presence: true, uniqueness: true, email: true
  
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  
    # def user_favs(user, houses)
    #   favs = []
    #   houses.each do |house|
    #     user.favorites.each do |fav|
    #       favs.push(house) if house.id == fav.house_id
    #     end
    #   end
    #   favs
    # end
  end
  