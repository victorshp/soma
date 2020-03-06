class AnswersController < ApplicationController
  def index
    @answers = answers.questions
  end
end
