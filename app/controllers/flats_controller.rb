class FlatsController < ApplicationController

  def index
    if params[:query_string]
      @flats = Flat.where("name LIKE ?", "%#{params[:query_string]}%")
    else 
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end
  private

  def flat_params

    params.require(:flat).permit(:name, :address, :descritpion, :price_per_night, :number_of_guests)
  end
  
end
