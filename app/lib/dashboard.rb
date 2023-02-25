class Dashboard
  def initialize(json)
    @json = json
  end

  def serialize
    # Pick values from response as required
    { 
      state: "SUCCESS",
      values: {
        battery_power: @json.dig("result", "batteryPower")
      }
    }
  end
end
