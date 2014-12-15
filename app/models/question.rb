class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :title, :description, :user_id, presence: true
end
