class CardsController < ApplicationController
  before_action :show, only: [:edit, :update]
  skip_before_action :verify_authenticity_token

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to cards_path
    else
      render :new
    end
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      render :edit
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to cards_path
  end

  private

  #def set_card
  # @card = Card.find(params[:id])
  #end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
