class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
    json_response(@quotes)
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote, :created)
  end

  def update
    @quote = Quote.find(params[:id])
    @quote.update(quote_params)
    if @quote.update!(quote_params)
      render status: 200, json: {
        message: "Ooh girl, you can update my params any day"
      }
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    if @quote.destroy!
      render status: 200, json: {
        message: "That wasn't such a good quote anyway. Good thing it has been successfully deleted!"
      }
    end
  end

  private

  def quote_params
    params.permit(:author, :content)
  end
end
