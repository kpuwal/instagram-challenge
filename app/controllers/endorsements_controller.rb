class EndorsementsController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.endorsements.create
    render json: { new_endorsement_count: @picture.endorsements.count }
  end

end
