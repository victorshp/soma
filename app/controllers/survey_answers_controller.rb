class SurveyAnswersController < ApplicationController


  def new
    @survey_answer = SurveyAnswer.new
    @survey = Survey.find(params[:survey_id])
    @survey_answer.survey = @survey
    @survey_answer.user = current_user
    @survey_answer.save!
  end

  private

  def survey_params
    params.require(:survey_answer).permit(answers_attributes: [:content])
  end
end
