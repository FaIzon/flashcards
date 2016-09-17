class HomeController < ApplicationController
  def index
    @card = Card.review_date_expired.random_card
    flash[:info] = 'Попробуй позже.' if @card.blank?
  end

  def check
    @card = Card.find(params[:card][:id])
    original_text = params[:card][:original_text]
    if @card.update_review_date(original_text)
      flash[:success] = 'Yes!'
    else
      flash[:danger] = 'No'
    end
    redirect_to root_url
  end
end
