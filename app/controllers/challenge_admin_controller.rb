require 'challenges'

class ChallengeAdminController < ApplicationController
  
  # this is essentially the sames as challenges#show - if changes to 
  # the show view page, update this preview view page as well
  def preview
    @challenge_detail = Challenges.find_by_id(current_access_token, params[:id])[0]
  end

end
