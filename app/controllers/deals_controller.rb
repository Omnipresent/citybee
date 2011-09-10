class DealsController < ApplicationController
  def new
    @deal = Deal.new
    2.times { @deal.offers.build }
    2.times { @deal.locations.build }
  end

  def markasused 
    user = session[:user]
    #make sure the passed offer id belongs to logged in user
    puts params[:id]
    download_entry = user.downloads.find_by_offer_id(params[:id])
    if download_entry != nil
      if params[:used] == "used"
        download_entry.marked_used = Time.now
        download_entry.save
      elsif params[:used] == "unused"
        download_entry.marked_used = nil
        download_entry.save
      end
    end
    redirect_to "/home/myaccount"
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
    puts session[:sting]
    if params[:id] == nil
      @deal = Deal.where(:featured_deal => true).order("updated_at desc").first
      @deals = Deal.where(:featured_deal => false)
    else
      @deal = Deal.find(params[:id])
      @deals = Deal.where("id <> ?", params[:id])
    end
  end
end
