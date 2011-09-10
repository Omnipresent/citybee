class UsersController < ApplicationController
  def download
    puts params[:deal_id]
    user = User.find(session[:user_id])
    times_used = user.offers.where("offer_id = ?", params[:offer_id]).count
    user_coupon_code = nil
    if times_used > 0
      redirect_to "/dailydeal", :notice => "You've already grabbed this deal. Check your <a href=''>Coupons</a> page"
    else
      user_coupon_code = User.generate_coupon
      download = user.downloads.create(:user_id=>user.id, :deal_id=>params[:deal_id], :offer_id=>params[:offer_id], :coupon_id=>user_coupon_code)
      if session[:sting]!=nil
        passer = Download.select("user_id").where("id = ?", session[:sting]).first
        Influence.create(:user_id=>passer.user_id, :download_id=>download.id, :influenced_used_id=>user.id)
      end
      redirect_to "/home/myaccount", :notice => "We heard blah blah is really good at XXX.<br> <a href='http://localhost:3000/string=#{download.id}'>http://localhost:3000/sting=#{download.id}</a> "
    end
  end
  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/dailydeal", :notice => "Welcome to CityBee!"
    else
      render "new"
    end
  end

  def influenced
    session[:sting]=params[:id]
    redirect_to "/dailydeal"
  end
end
