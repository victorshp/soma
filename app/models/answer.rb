class Answer < ApplicationRecord
  belongs_to :survey_answer
  belongs_to :question
  belongs_to :answer
  validates :content,  presence: true
end
