# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_admin, only: %i[index show edit update destroy]
  before_action :set_user, only: %i[show edit update destroy]
  def current
    if current_user
      @user = current_user
    else
      redirect_to user_session_path
    end
  end

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :role)
  end

  def authorize_admin
    redirect_to root_path, alert: "Permission denied" unless user_signed_in? && current_user.is_admin?
  end
end
