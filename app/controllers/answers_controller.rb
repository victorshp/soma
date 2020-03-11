class AnswersController < ApplicationController
before_action :get_question, only: [:create]

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @survey = @question.survey
    survey_answer = SurveyAnswer.where(user_id: current_user, survey_id: @survey.id ).first
    @answer.survey_answer_id = survey_answer.id
    @answer.save
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def get_question
    @question = Question.find(params[:question_id])
  end

  def check_surveys
    @survey.question
  end
end
