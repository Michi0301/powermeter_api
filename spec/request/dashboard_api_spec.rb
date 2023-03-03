require "rails_helper"

RSpec.describe "Dashboard api", type: :request do
  context "Success" do
    before do
      resonse_body = File.open("./spec/fixtures/evcc_state.json")

      stub_request(:get, "http://localhost:7070/api/state")
        .to_return(status: 200, body: resonse_body)

      get "/dashboards", params: {}, headers: { "Authorization" => "Bearer change-me" }
    end

    it "Responds with a 200 HTTP code" do
      expect(response.status).to eq(200)
    end

    it "Responds with a proper json document" do
      expect(response.body).to eq({  
        "state": "SUCCESS",
        "values": {
          "battery_power": 1234,
          "battery_soc": 73,
          "charge_power": 3260,
          "grid_power": 8.9,
          "home_power": 373.9000000000001,
          "pv_power": 3661
        }
      }.to_json)
    end
  end

  context "Remote error" do
    before do
      stub_request(:get, "http://localhost:7070/api/state")
        .to_return(status: 500, body: "")

      get "/dashboards", params: {}, headers: { "Authorization" => "Bearer change-me" }
    end

    it "Responds with a 500 HTTP code" do
      expect(response.status).to eq(500)
    end

    it "Responds with a meaningful message" do
      expect(response.body).to eq({  
        "state": "ERROR",
        "message": "An error occured fetching data from server."
      }.to_json)
    end
  end

  context "Insufficient authentication" do
    it "Responds with a 500 HTTP code with wrong api token" do
      get "/dashboards", params: {}, headers: { "Authorization" => "Bearer wrong" }

      expect(response.status).to eq(401)
    end

    it "Responds with a 500 HTTP code with missing api token" do
      get "/dashboards", params: {}, headers: { "Authorization" => "" }

      expect(response.status).to eq(401)
    end
  end
end
