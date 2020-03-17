class SurveyAnswer < ApplicationRecord
  belongs_to :survey
  belongs_to :user
  has_many :answers, dependent: :destroy
  monetize :reward_cents

  accepts_nested_attributes_for :answers
end
