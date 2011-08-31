class SomesController < ApplicationController
  def index
    @somes = Some.all
  end

  def show
    @some = Some.find(params[:id])
  end

  def new
    @some = Some.new
  end

  def create
    @some = Some.new(params[:some])
    if @some.save
      redirect_to @some, :notice => "Successfully created some."
    else
      render :action => 'new'
    end
  end

  def edit
    @some = Some.find(params[:id])
  end

  def update
    @some = Some.find(params[:id])
    if @some.update_attributes(params[:some])
      redirect_to @some, :notice  => "Successfully updated some."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @some = Some.find(params[:id])
    @some.destroy
    redirect_to somes_url, :notice => "Successfully destroyed some."
  end
end
