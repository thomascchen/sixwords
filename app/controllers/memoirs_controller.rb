class MemoirsController < ApplicationController
  def index
    if params[:query] == nil || params[:query].match(/^\s*$/)
      @memoirs = Memoir.order("random()")
    elsif params[:query].split.size == 1
      @memoirs = Memoir.where("memoir ILIKE '%#{params[:query]}%' OR name ILIKE '%#{params[:query]}%'")
    elsif params[:query].split.size >= 2
      split_query = params[:query].split
      mapped_split_query = split_query.map { |word| "(memoir ILIKE '%#{word}%' OR name ILIKE '%#{word}%') AND " }
      formatted_query = mapped_split_query.inject(:+).rpartition(" AND ").first
      @memoirs = Memoir.where(formatted_query)
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
      redirect_to memoir_path(@memoir)
    else
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
