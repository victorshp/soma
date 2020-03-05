class Answer < ApplicationRecord
  belongs_to :survey_answer
  belongs_to :question
  validades :content,  presence: true
end
