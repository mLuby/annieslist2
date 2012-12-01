class RestaurantsController < ApplicationController
  before_filter :find_location
    
  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }
    end
  end

  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = @location.restaurants.create(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to location_restaurants_path(@location), notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to location_path(@restaurant.location_id), notice: @restaurant.name + ' was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #
  # need to delete visits based on this restaurant!
  #
  
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to location_restaurants_path(@restaurant.location_id), notice: @restaurant.name + ' was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def find_location
    @location = Location.find(params[:location_id])
  end

end
