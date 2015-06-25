class MemoirsController < ApplicationController
  def index
    if params[:q] == nil
      @memoirs = Memoir.order("random()").limit(6)
    else
      @memoirs = Memoir.where("memoir ILIKE '%#{params[:q]}%'")
    end
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

  def search
    if params[:search] == nil
      render :index
    else
      @memoirs = Memoir.where("memoir ILIKE '%#{params[:search]}%'")
      redirect_to root_path
    end
  end

  protected

  def memoir_params
    params.require(:memoir).permit(:name, :age, :memoir, :neighborhood_id)
  end

end
