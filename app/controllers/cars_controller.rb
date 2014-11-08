class CarsController < ApplicationController
  before_action :find_car, only: [:edit, :update]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} created"
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
  end

  def update
      @car.update(car_params)
        redirect_to cars_path,
      notice: 'Car was successfully updated.'
  end

  private

  def car_params
    params.required(:car).permit(:year, :make, :model, :price)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
