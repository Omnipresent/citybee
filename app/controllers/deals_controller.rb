class DealsController < ApplicationController
  def new
    @deal = Deal.new
    3.times { @deal.offers.build }
  end

  def create
    @deal = Deal.new(params[:deal])
    if @deal.save
      redirect_to deals_url, :notice => "Successfully created deal."
    else
      render :action => 'new'
    end
  end

  def index
    @deals = Deal.all
  end
end
