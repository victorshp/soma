class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :surveys
  has_many :survey_answers

  # enum role: [:surveyor, :surveyee, :both]

  has_many :orders

end
