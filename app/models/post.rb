class Post < ApplicationRecord
  belongs_to :user

  has_many :comments

  validates :title, :body, :user_id, presence: true
  # validates :body, length: {maximum: 250}
end
