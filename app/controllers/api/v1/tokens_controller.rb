class Api::V1::TokensController < ApplicationController
#   skip_before_action :authenticate_request, only: [:index, :show, :create]

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
      @token.status = :new;
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
  
  def vote_for_token 
    @token = Token.find(params[:id]);
    @token.votes += 1;

    if @token.save
        render json: @token, status: 200
    else
        render json: { errors: @token.errors.full_messages },
        status: :unprocessable_entity
    end
  end


  # Add new token
  def add_new_token
    @token = Token.new(data_params)
    @token.status = :new;
    
    if @token.save
        render json: @token, status: :created
    else
        render json: { errors: @token.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  private 
      def token_params
          params.permit(:name, :date_created, :date_updated, :date_deleted, :blockchain)
      end

      def data_params
        params.permit(:token_detail)
    end
  
end
