class CardsController < ApplicationController
  before_action :require_login, :only => :new
  
  def index
    @cards = Card.all.order('created_at DESC')
  end

  def new
    @card = current_user.cards.new
  end

  def create
   
    @card = current_user.cards.build(card_params)
    if @card.save
      redirect_to cards_path
    else
      redirect_to @card
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private
    def card_params
      params.require(:card).permit(:title, :body, :status)
    end
end
