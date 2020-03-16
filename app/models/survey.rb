class Survey < ApplicationRecord
  belongs_to :user
  has_many :users, through: :survey_answer
  has_many :questions, inverse_of: :survey, dependent: :destroy
  has_many :answers, through: :question
  has_many :survey_answers
  has_many :orders
  monetize :price_cents

  accepts_nested_attributes_for :questions
end
