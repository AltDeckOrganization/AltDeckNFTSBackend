class Api::V1::LaunchpadStatistics < ApplicationController

  # GET /launchpad_statistics
  def index
    @statistics = LaunchpadStatistic.all
    render json: @statistics
  end

  # GET /launchpad_statistics/:id
  def show
    @statistic = LaunchpadStatistic.find(params[:id])
    render json: @statistic
  end

  # POST /launchpad_statistics
  def create
    @statistic = LaunchpadStatistic.new(statistics_params)
    @statistic.active = false;
    if @statistic.save
      render json: @statistic
    else
      render error: {error: "Unable to create Statistics"}, status: 400
    end
  end

  # PUT /launchpad_statistics/:id
  def update
    @statistic = LaunchpadStatistic.find(params[:id])
    if @statistic
      @statistic.update(statistics_params)
      render json: {message: 'Statistics successfully updated!'}, status: 200
    else
      render json: {error: 'Unable to update Statistics.'}, status: 400
    end
  end

  # DELETE /lauchpad_statistics/:id
  def destroy
    @statistic = LaunchpadStatistic.find(params[:id])
    if @statistic
      @statistic.destroy
      render json: {message: 'Statistics successfully deleted'}, status: 200
    else
      render json: {error: 'Unable to delete statistics'}, status: 400
  end

  private

  def statistics_params
    params.permit(:launch_id, :whitelist_mint_settings, :mint_price, :mint_currency)
  end
end