class Dashboard
  def initialize(json)
    @json = json
  end

  def serialize
    # Pick values from response as required
    { 
      state: "SUCCESS",
      values: {
        battery_power: @json.dig("result", "batteryPower"),
        battery_soc: @json.dig("result", "batterySoc"),
        charge_power: @json.dig("result", "loadpoints", 0, "chargePower"),
        grid_power: @json.dig("result", "gridPower"),
        home_power: @json.dig("result", "homePower"),
        pv_power: @json.dig("result", "pvPower")
      }
    }
  end
end
