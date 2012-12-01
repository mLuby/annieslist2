class VisitsController < ApplicationController
  before_filter :find_location
  before_filter :find_restaurant
  before_filter :find_user
     
  def create

    @visit = Visit.new(:user_id => @user.id, :restaurant_id => @restaurant.id)

    respond_to do |format|
      if @visit.save
        format.html { redirect_to location_restaurants_path(@location) }
        format.json { render json: @visit, status: :created, location: @visit }
      else
        format.html { render action: "new" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @visit = Visit.find_by_user_id_and_restaurant_id(@user.id, @restaurant.id)
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to location_restaurants_path(@location) }
      format.json { head :no_content }
    end
  end
  
  private

  def find_location
    @location = Location.find(params[:location_id])
  end
  
  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_user
    @user = current_user
  end

end
