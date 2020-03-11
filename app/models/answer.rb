class Answer < ApplicationRecord
  belongs_to :survey_answer
  belongs_to :question
  validates :content,  presence: true
end
