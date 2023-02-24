require "rails_helper"

RSpec.describe "Dashboard api", type: :request do
  context "Success" do
    before do
      resonse_body = File.open("./spec/fixtures/evcc_state.json")

      stub_request(:get, "http://localhost:7070/api/state")
        .to_return(status: 200, body: resonse_body)
    end

    it "Responds with a 200 HTTP code" do
      get "/dashboards"

      expect(response.status).to eq(200)
    end

    it "Responds with a proper json document" do
      get "/dashboards"

      expect(response.body).to eq({  
        "state": "SUCCESS",
        "values": {
          "battery_power": 1234
        }
      }.to_json)
    end
  end

  context "Error" do
    before do
      stub_request(:get, "http://localhost:7070/api/state")
        .to_return(status: 500, body: "")
    end

    it "Responds with a 500 HTTP code" do
      get "/dashboards"

      expect(response.status).to eq(500)
    end

    it "Responds with a meaningful message" do
      get "/dashboards"

      expect(response.body).to eq({  
        "state": "ERROR",
        "message": "An error occured fetching data from server."
      }.to_json)
    end
  end
end
