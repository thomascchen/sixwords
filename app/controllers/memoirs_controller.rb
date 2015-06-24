class MemoirsController < ApplicationController
  def index
    @memoirs = Memoir.all
  end

  def new
    @memoir = Memoir.new
    @neighborhood_options = Neighborhood.all.map {|n| [n.name, n.id]}
  end

  def create
    @memoir = Memoir.new(memoir_params)
    if @memoir.save
      flash[:notice] = 'Memoir added.'
      redirect_to memoir_path
    else
      flash[:error] = @memoir.errors.full_messages.join(". ")
      render :new
    end
  end

  protected

  def memoir_params
    params.require(:memoir).permit(:name, :age, :memoir, :neighborhood_id)
  end

end
