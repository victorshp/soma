class ProfilesController < ApplicationController
  def show
    @user = current_user
    # @survey_id = survey.id
  end


end
