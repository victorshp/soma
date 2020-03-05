class Survey < ApplicationRecord
  belongs_to :user
  has_many :users, through: :survey_answer
  has_many :questions
  has_many :answers, through: :question
  has_many :survey_answers
end
