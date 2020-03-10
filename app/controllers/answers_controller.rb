class AnswersController < ApplicationController

def new
    @answer = Answers.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = question.find(params[:question_id])
    @answer.user = current_user
    @answer.save
  end

  private
    def answer_params
      params.require(:answer).permit(:content)
  end
end
