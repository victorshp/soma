class AnswersController < ApplicationController
<<<<<<< Updated upstream

def new
    @answer = Answers.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = question.find(params[:question_id])
    @answer.user = current_user
=======
  before_action :get_question, only: [:create]

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @survey = @question.survey
    survey_answer = SurveyAnswer.where(user_id: current_user, survey_id: @survey.id ).first
    @answer.survey_answer_id = survey_answer.id
>>>>>>> Stashed changes
    @answer.save
  end

  private
<<<<<<< Updated upstream
    def answer_params
      params.require(:answer).permit(:content)
=======

  def answer_params
    params.require(:answer).permit(:content)
  end

  def get_question
    @question = Question.find(params[:question_id])
  end

  def check_surveys
    @survey.question
>>>>>>> Stashed changes
  end
end
