class EndorsementsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @review.endorsements.create
  end

end
