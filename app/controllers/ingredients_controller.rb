# frozen_string_literal: true

class IngredientsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_ingredient, only: %i[show edit update destroy]

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = if params[:q]
                     Ingredient.active.where('lower(name) LIKE ?', "%#{params[:q]}%").all
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
                     Ingredient.where('lower(name) LIKE ?', "%#{params[:q]}%").all
                   else
                     []
                   end
    render layout: false
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show; end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit; end

  # POST /ingredients or /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user_id = current_user.id
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredient_url(@ingredient), notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1 or /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredient_url(@ingredient), notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1 or /ingredients/1.json
  def destroy
    #@ingredient.destroy
    @ingredient.status = 'inactive'
    @ingredient.save
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.', status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end
