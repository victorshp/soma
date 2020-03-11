class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
    @question = @survey.questions.build
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user

    if @survey.save

      redirect_to @survey
    else
      render :new
    end
  end

  def show
    @answer = Answer.new()
  end

  def edit
  end

  def destroy
    @survey.destroy
    redirect_to @survey
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survey_params
      params.require(:survey).permit(:title, questions_attributes: [:id, :content])
    end
end
