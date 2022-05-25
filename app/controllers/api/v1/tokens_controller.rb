require "http"

class Api::V1::TokensController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show, :create, :vote_for_token, :recaptcha]

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

  # POST /tokens
  def create
      @token = Token.new(token_params)
      @token.status = :recent;
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

  # VERIFY token
  def recaptcha
    res = HTTP.post("https://www.google.com/recaptcha/api/siteverify", 
        :data => {'secret' => ENV['SECRET_KEY']})
    p res.parse
  end

  private 
      def token_params
          params.permit(:name, :blockchain, :token_detail, :votes)
      end
end
