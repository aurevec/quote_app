class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find params[:id]
  rescue ActiveRecord::RecordNotFound => ex
    flash.alert = 'Quote could not be found.'
    redirect_to quotes_path
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(params[:quote])
    if @quote.save
      redirect_to @quote
    else
      flash.now.alert = 'There were some errors.'
      render :new
    end
  end

  def edit
    @quote = Quote.find params[:id]
  end

  def update
    @quote = Quote.find params[:id]
    if @quote.update_attributes params[:quote]
      redirect_to @quote
    else
      flash.now.alert = 'There were some errors.'
      render :edit
    end
  end

  def send_to_xrono
    @quote = Quote.find params[:id]
    if @quote.create_in_xrono
      flash.alert = 'The quote has been imported into Xrono.'
    else
      flash.alert = 'There was an error trying to import the quote into Xrono.'
    end
    redirect_to :back
  end

end
