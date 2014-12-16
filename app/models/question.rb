class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title, :description, :user_id, presence: true
  validates :title, length: { minimum: 40 }
  validates :description, length: { minimum: 140 }


end
