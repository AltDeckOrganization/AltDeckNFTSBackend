class Api::V1::TokensController < ApplicationController
  
  # GET /tokens
  def index 
      @tokens = Token.all 
      render json: @tokens, status: :ok
  end

  # GET /tokens/:id
  def show 
    @token = Token.find(params[:id])
    render json: @token, status: :ok
  end 

  # POST /tokens/:id
  def create
      @token = Token.new(token_params)
      if @token.save
          render json: @token, status: :created
      else
          render json: { errors: @token.errors.full_messages },
          status: :unprocessable_entity
      end
  end

  # PUT /tokens/:id
  def update
      unless @token.update(token_params)
          render json: { errors: @token.errors.full_messages },
          status: :unprocessable_entity
      end
  end

  # DELETE /tokens/:id
  def destroy
      @token.destroy
  end

  private 
      def token_params
          params.permit(:name, :date_created, :date_updated, :date_deleted, :blockchain, :votes)
      end 
end
