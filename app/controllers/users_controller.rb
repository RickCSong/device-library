class UsersController < ApplicationController
  before_filter :set_user, only: [:show]

  # GET /users.json
  def index
    @users = User.all.includes(:devices)
    respond_to do |format|
      format.json
    end
  end

  # GET /users/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  private

  def set_user
    @user = if params[:id] == 'current'
              current_user
            else
              User.find(params[:id])
            end
  end
end
