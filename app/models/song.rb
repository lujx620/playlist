class Song < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, source: :user
  validates :artist, :title, presence: true, length: { minimum: 2 }
end
