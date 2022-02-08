# frozen_string_literal: true

class DishesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_dish, only: %i[show edit update destroy]

  # GET /dishes or /dishes.json
  def index
    @dishes = Dish.all
  end

  # GET /dishes/1 or /dishes/1.json
  def show
    logger.info "@----------------------------------------------------- Dish id: #{@dish.id} "
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
    @ingredients = []
  end

  # GET /dishes/1/edit
  def edit
    redirect_to dishes_path, alert: "Permission denied" unless current_user.is_admin? || current_user.is_moderator? || current_user.id == @dish.user_id
    logger.info "@----------------------------------------------------- Dish id: #{@dish.id} "
  end

  # POST /dishes or /dishes.json
  def create
    @dish = Dish.new(dish_params)
    @dish.user_id = current_user.id
    respond_to do |format|
      if @dish.save
        @dish.save_ingredients(params[:dish][:ingredients].map(&:to_i))
        format.html { redirect_to dish_url(@dish), notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1 or /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        @dish.dish_ingredients.destroy_all
        @dish.save_ingredients(params[:dish][:ingredients].map(&:to_i))
        format.html { redirect_to dish_url(@dish), notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1 or /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.', status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dish
    @dish = Dish.find_by_id(params[:id])
    if @dish
      @ingredients = @dish.ingredients
    else
      redirect_to dishes_path
    end
  end

  # Only allow a list of trusted parameters through.
  def dish_params
    params.require(:dish).permit(:name, :description, :image)
  end
end
