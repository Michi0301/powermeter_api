class DashboardsController < ApplicationController
  # GET /dashboards
  def index
    data = {
      current_power: 123.00,
      status: "CHARGING"
    }

    render json: data
  end
end
