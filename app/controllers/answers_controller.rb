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

    survey_answer.reward = survey_answer.answers.count * 0.1
    survey_answer.save

    redirect_to profile_path, notice: "Thanks for answering! You will receive R$ #{survey_answer.reward}, your rewards will be placed in a few minutes"
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
