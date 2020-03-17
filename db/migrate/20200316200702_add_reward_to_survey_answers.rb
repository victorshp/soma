class AddRewardToSurveyAnswers < ActiveRecord::Migration[5.2]
  def change
      add_monetize :survey_answers, :reward, currency: { present: false }
  end
end
