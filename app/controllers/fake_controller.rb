class FakwesController < ApplicationController
  before_action :user_admin, only: [:create, :update, :edit, :destroy]

  def index
    @fakes = Fakwe.all
    @most_reviews = @fakes.most_reviews
    render :index
  end

  def new
    @fake = Fakwe.new
    render :new
  end

  def create
    @fake = Fakwe.new(fake_params)
    if @fake.save
      flash[:notice] = "Fakwe successfully created."
      render :show
    else
      render :new
    end
  end

  def edit
    @fake = Fakwe.find(params[:id])
    render :edit
  end

  def show
    @fake = Fakwe.find(params[:id])
    @fake.photos.attach(params[:photos])
    render :show
  end

  def update
    @fake= Fakwe.find(params[:id])
    if @fake.update(fake_params)
      redirect_to fakes_path
    else
      render :edit
    end
  end

  def destroy
    @fake = Fakwe.find(params[:id])
    @fake.destroy
    flash[:notice] = "Fakwe successfully deleted."
    redirect_to fakes_path
  end


  private
  def fake_params
    params.require(:fake).permit(:name, :cost, :country_of_origin, photos: [])
  end
end
