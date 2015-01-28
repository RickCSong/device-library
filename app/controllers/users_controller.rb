class UsersController < ApplicationController
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.json
    end
  end

  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json
    end
  end
end
