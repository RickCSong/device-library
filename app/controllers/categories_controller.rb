class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.json
    end
  end

  # GET /categories/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.json { render 'show', status: :created }
      else
        format.json { render json: {errors: @category.errors}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.json { head :no_content }
      else
        format.json { render json: {errors: @category.errors}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :code)
  end
end
