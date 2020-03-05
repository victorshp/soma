class SurveyAnswer < ApplicationRecord
  belongs_to :survey
  belongs_to :user
  has_many :answers
end
