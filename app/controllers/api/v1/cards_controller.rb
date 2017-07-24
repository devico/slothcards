module Api
  module V1
    class CardsController < ApplicationController
      respond_to :json

      def index
        respond_with Card.all.order('created_at DESC')
      end

      def show
        respond_with Card.find(params[:id])
      end
    end
  end
end
