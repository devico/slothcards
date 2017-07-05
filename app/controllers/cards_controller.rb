class CardsController < ApplicationController
  before_action :require_login, :only => :new
  before_action :set_card, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to @card
    else
      render 'new'
    end
  end

  def destroy
    @card.destroy

    redirect_to root_path
  end

  private
    def set_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:title, :body, :status)
    end
end
