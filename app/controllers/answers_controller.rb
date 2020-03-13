class AnswersController < ApplicationController
before_action :get_question, only: [:create]

  def create
    @survey = Question.find(params[:answer].keys.first).survey
    survey_answer = SurveyAnswer.where(user_id: current_user, survey_id: @survey.id ).first

    params[:answer].each do |question_id, answer_content|
      answer = Answer.new
      answer.content = answer_content
      answer.question_id = question_id
      answer.survey_answer_id = survey_answer.id
      if !answer.save
        render('survey_answers/new', alert: 'Please answer all the questions!') and return
      end
    end

    redirect_to profile_path, notice: 'Thanks for answering! You received R$ 0,30'
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
