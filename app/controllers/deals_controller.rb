class DealsController < ApplicationController
  def new
    @deal = Deal.new
    2.times { @deal.offers.build }
    2.times { @deal.locations.build }
  end

  def create
    @deal = Deal.new(params[:deal])
    if @deal.save
      redirect_to deals_url, :notice => "Successfully created deal."
    else
      render :action => 'new'
    end
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def update
    @deal= Deal.find(params[:id])
    if @deal.update_attributes(params[:deal])
      redirect_to "/deals", :notice  => "Successfully updated deal."
    else
      render :action => 'edit'
    end
  end

  def index
    @deals = Deal.all
  end

  def show
    @deal = Deal.where(:featured_deal => true).order("updated_at desc").first
    @deals = Deal.all
  end
end
