class SurveyAnswersController < ApplicationController

  def index
    @survey = Survey.find(params[:survey_id])
    # @answers = SurveyAnswer.where(survey_id: @surveys.id)
    @questions = Question.where(survey_id: @survey)
    @answers =  Answer.where(question_id: @questions.ids)

  end

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

  # def count_answers
  #   @questions.each do |question|
  #     simple_format(question.content)
  #     question.answers.each do |answer|
  #       a = 0
  #       b = 0
  #       c = 0
  #       d = 0
  #       answer.content
  #       if answer.content == "A"
  #         @a =+ 1
  #       elsif answer.content == "B"
  #         @b =+ 1
  #       elsif answer.content == "C"
  #         @c =+ 1
  #       elsif answer.content == "D"
  #         @d =+ 1
  #       end
  #     end
  #     "A = #{0 + @a.to_i}"
  #     "B = #{0 + @b.to_i}"
  #     "C = #{0 + @c.to_i}"
  #     "D = #{0 + @d.to_i}"
  #   end
end
