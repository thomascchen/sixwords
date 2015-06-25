class MemoirsController < ApplicationController
  def index
    @memoirs = Memoir.order("random()").limit(6)
  end

  def show
    @memoir = Memoir.find(params[:id])
  end

  def new
    @memoir = Memoir.new
  end

  def create
    @memoir = Memoir.new(memoir_params)
    if @memoir.save
      flash[:notice] = 'Memoir added.'
      redirect_to memoir_path(@memoir)
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
