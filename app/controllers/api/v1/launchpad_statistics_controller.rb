class Api::V1::LaunchpadStatisticsController < ApplicationController

  # GET /launchpad_statistics
  def index
    @statistics = LaunchpadStatistic.all
    render json: @statistics, status: :ok
  end

  # GET /launchpad_statistics/:id
  def show
    @statistic = LaunchpadStatistic.find(params[:id])
    render json: @statistic, status: :ok
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
      render json: {message: 'Statistics successfully deleted!'}, status: 200
    else
      render json: {error: 'Unable to delete statistics'}, status: 400
    end
  end

  # Update Altdeck revenue and total revenue generated
  # PUT /admin_launchpad_revenue/:id
  def launchpad_revenue
    @revenue = LaunchpadStatistic.find(params[:id])
    if @revenue
      @revenue.update(revenue_params)
      render json: {message: 'revenue successfully updated!'}, status: 200
    else
      render error: {error: "Unable to create revenue"}, status: 400
    end
  end

  private

  def statistics_params
    params.permit(:launch_id, :whitelist_mint_settings, :mint_price, :mint_currency)
  end

  def revenue_params
    params.permit(:altdeck_revenue, :total_revenue_generated)
  end
end