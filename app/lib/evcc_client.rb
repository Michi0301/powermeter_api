class EvccClient
  include HTTParty
  base_uri PowermeterApi::Application.config.evcc_api

  def initialize
    @options = { format: :json }
  end

  def state
    self.class.get("/state", @options)
  end
end
