class HomeController < ApplicationController
  def index
    @card = Card.review_date_expired.random_card
    flash[:info] = 'Попробуй позже.' unless @card
  end

  def check
    @card = Card.find(params[:card][:id])
    if update_review_date(params[:card][:original_text])
      flash[:success] = 'Yes!'
    else
      flash[:danger] = 'No'
    end
    redirect_to root_url
  end

  def update_review_date(random_card_original_text)
    if @card.words_are_equal?(random_card_original_text, @card.original_text)
      @card.update_attribute(:review_date, @card.set_review_date)
      true
    else
      false
    end
  end

end
