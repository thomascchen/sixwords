class NeighborhoodsController < ApplicationController
  def index
    @neighborhoods = Neighborhood.all
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])

    if @neighborhood.memoirs.empty?
      flash[:notice] = "No memoirs for that neighborhood yet"
      redirect_to neighborhoods_path
    else
      @memoirs = @neighborhood.memoirs
    end
  end
end
