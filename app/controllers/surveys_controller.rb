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
    @survey.price = 10 + survey_params[:questions_attributes].to_h.size * 0.5

    if @survey.save
      order  = Order.create!(survey: @survey, amount: @survey.price_cents, state: 'pending', user: current_user)

        session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: @survey.title,
            amount: @survey.price_cents,
            currency: 'brl',
            quantity: 1
          }],
          success_url: survey_url(@survey),
          cancel_url: survey_url(@survey)
        )

        order.update(checkout_session_id: session.id)

      redirect_to @survey
    else
      render :new
    end

  end

  def show
    @order = @survey.orders.last
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
