class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    respond_to do |format|
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.json { render json: @category }
    end
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.json { render json: @category }
      else
        format.json { render json: {errors: @category.errors}, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update(category_params)
        format.json { render json: @category }
      else
        format.json { render json: {errors: @category.errors}, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.json { render json: @category }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :code)
  end
end
