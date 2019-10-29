class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to airplane_path(@review.booking.airplane)
    else
      render :new
    end
  end
