class Api::V1::CategoriesController < ApplicationController
  
  # GET /categories
  def index 
      @categories = Category.all 
      render json: @categories, status: :ok
  end

  # GET /categories/:id
  def show 
    @category = Category.find(params[:id])
    render json: @category, status: :ok
  end 

  # POST /categories/:id
  def create
      @category = Category.new(category_params)
      if @category.save
          render json: @category, status: :created
      else
          render json: { errors: @category.errors.full_messages },
          status: :unprocessable_entity
      end
  end

  # PUT /categories/:id
  def update
      unless @category.update(category_params)
          render json: { errors: @category.errors.full_messages },
          status: :unprocessable_entity
      end
  end

  # DELETE /categories/:id
  def destroy
      @category.destroy
  end

  private 
      def category_params
          params.permit(:name)
      end 

      def set_category
          @category = Category.find(params[:id])
      end
  
end
