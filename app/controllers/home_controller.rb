class HomeController < ApplicationController
  def index
    @card = Card.review_date_expired.random_card
    flash[:info] = 'Попробуй позже.' unless @card
  end

  def check
    @card = Card.find(params[:card][:id])
    if words_are_equal?(params[:card][:original_text], @card.original_text)
      update_review_date(params[:card][:original_text])
      flash[:success] = 'Yes!'
    else
      flash[:danger] = 'No'
    end
    redirect_to root_url
  end

  def words_are_equal?(first_word, second_word)
    first_word.casecmp(second_word).zero?
  end

  def update_review_date(random_card_original_text)
      @card.update_attribute(:review_date, @card.set_review_date)
  end

end
