class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update]


  def index
    @question = survey.questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.survey = Survey.find(params[:survey_id])
    @question.user = current_user
    @question.save
  end

  def edit
  end

  def update
    @question.update(question_params)
  end

  def destroy
    @question.update(question_params)
  end

  private

  def set_question
    @question.survey = Survey.find(params[:survey_id])
  end

  def question_params
    params.require(:question).permit(:question)
  end
end
