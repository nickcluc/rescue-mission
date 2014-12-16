class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :description, :user_id, :question_id, presence: true
  validates :description, length: { minimum: 50 }
end
