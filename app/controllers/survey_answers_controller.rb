class SurveyAnswersController < ApplicationController
  def create
    @survey_answer = Suevey_answer.new
    @survey_answer.user = current_user
    @survey_answer.survey_id = params[:survey_id]
    @survey_answer.save
  end
end
