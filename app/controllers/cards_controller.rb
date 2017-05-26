class CardsController < ApplicationController
  
  def index
    @cards = Card.all.order('created_at DESC')
  end

  def new
  end

  def create
    @card = Card.new(card_params)
    @card.save

    redirect_to @card
  end

  def show
    @card = Card.find(params[:id])
  end

  private
    def card_params
      params.require(:card).permit(:title, :body)
    end
end
