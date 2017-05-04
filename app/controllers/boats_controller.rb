class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.create(
      name: session[:name],
      amtcontainersshipped: params[:boat][:amtcontainersshipped],
      location: params[:boat][:location],
      # date: params[:boat][:date]
    )
    if @boat.save
      flash[:notice] = "The boat was created"
      redirect_to "/boats"
    else
      flash[:alert] = "Boat was not created"
      redirect_to new_boat_path
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.name = params[:boat][:name]
    @boat.amtcontainersshipped = params[:boat][:amtcontainersshipped]
    @boat.location = params[:boat][:location]

    if @boat.save
      flash[:notice] = "Your changes were saved."
      redirect_to boat_path(@boat)
    else
      flash[:alert] = "Unable to save changes."
    end
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def destroy
    @boat = Boat.find(params[:id])

    if @boat.destroy
      flash[:notice] = "Boat was deleted."
      session[:boat_id] = nil
      redirect_to boats_path
    else
      flash[:alert] = "Unable to delete boat."
      redirect_to edit_boat_path
    end
  end
end
