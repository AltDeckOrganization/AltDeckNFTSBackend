class Api::V1::VotesController < ApplicationController
  
  # GET /votes
  def index 
      @votes = Vote.all 
      render json: @votes, status: :ok
  end

  # GET /votes/:id
  def show 
    @vote = Vote.find(params[:id])
    render json: @vote, status: :ok
  end 

  # POST /votes/:id
  def create
      @vote = Vote.new(vote_params)
      if @vote.save
          render json: @vote, status: :created
      else
          render json: { errors: @vote.errors.full_messages },
          status: :unprocessable_entity
      end
  end

  # PUT /votes/:id
  def update
      unless @vote.update(vote_params)
          render json: { errors: @vote.errors.full_messages },
          status: :unprocessable_entity
      end
  end

  # DELETE /votes/:id
  def destroy
      @vote.destroy
  end

  private 
      def vote_params
          params.permit(:wallet_address, :vote_date)
      end 
end
