class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy

  has_one_attached :image
  
  validates :name, uniqueness: true, presence: true
end
