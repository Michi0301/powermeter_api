class DashboardsController < ApplicationController
  rescue_from Errno::ECONNREFUSED, RemoteError, with: :render_error

  # GET /dashboards
  def index
      render json: Dashboard.new(remote_data).serialize
  end

 private

  def remote_data
    # Cache value per request
    @remote_data ||= EvccClient.new.state

    if @remote_data.success?
      @remote_data
    else
      raise RemoteError
    end
  end

  def render_error(error)
    render json: { state: "ERROR", message: error.message }, status: :internal_server_error
  end
end
