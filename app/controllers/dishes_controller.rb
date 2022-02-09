# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_dish, only: %i[show edit update destroy]

  def index
    @dishes = Dish.all
  end

  def show; end

  def new
    @dish = Dish.new
    @ingredients = []
  end

  def edit
    unless current_user.admin? || current_user.moderator? || current_user.id == @dish.user_id
      redirect_to dishes_path, alert: "Permission denied",
                               status:	:unauthorized
    end
  end

  def create
    @dish = Dish.new(dish_params)
    @dish.user_id = current_user.id
    if @dish.save
      @dish.save_ingredients(params[:dish][:ingredients].map(&:to_i)) if params[:dish][:ingredients]
      redirect_to dish_url(@dish), notice: "Dish was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dish.update(dish_params)
      @dish.dish_ingredients.destroy_all if params[:dish][:ingredients]
      @dish.save_ingredients(params[:dish][:ingredients].map(&:to_i)) if params[:dish][:ingredients]
      redirect_to dish_url(@dish), notice: "Dish was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishes_url, notice: "Dish was successfully destroyed.", status: :see_other
  end

  private

  def set_dish
    @dish = Dish.find_by(id: params[:id])
    if @dish
      @ingredients = @dish.ingredients
    else
      redirect_to dishes_path
    end
  end

  def dish_params
    params.require(:dish).permit(:name, :description, :image)
  end
end
