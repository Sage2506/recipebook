# frozen_string_literal: true

class IngredientsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_ingredient, only: %i[show edit update destroy]

  def index
    @ingredients = if params[:q]
                     Ingredient.active.where("lower(name) LIKE ?", "%#{params[:q]}%").all
                   else
                     Ingredient.active
                   end
    respond_to do |format|
      format.json { render json: @ingredients, layout: false }
      format.html {}
    end
  end

  def search
    @ingredients = if params[:q]
                     Ingredient.where("lower(name) LIKE ?", "%#{params[:q]}%").all
                   else
                     []
                   end
    render layout: false
  end

  def show
    redirect_to ingredients_path unless @ingredient&.is_active?
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    return if current_user.admin? || current_user.moderator? || current_user.id == @ingredient.user_id

    redirect_to ingredients_path, alert: "Permission denied",
                                  status: :unauthorized
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user_id = current_user.id
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @ingredient.destroy
    @ingredient.status = "inactive"
    @ingredient.save
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: "Ingredient was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
    redirect_to ingredients_path unless @ingredient
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end
