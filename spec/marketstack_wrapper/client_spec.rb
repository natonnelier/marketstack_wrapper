require "marketstack_wrapper"

RSpec.describe MarketstackWrapper::Client do
  let(:access_key) { "test_key" }
  let(:client) { MarketstackWrapper::Client.new(access_key) }

  describe "#get_all_tickers" do
    before { allow(client).to receive(:make_request).and_return([]) }

    it "fetches all tickers" do
      response = client.get_all_tickers
      expect(response).to be_a(Array) # Adjust based on the actual API response
    end
  end

  describe "#get_ticker" do
    before { allow(client).to receive(:make_request).and_return({}) }

    it "fetches a specific ticker" do
      response = client.get_ticker("AAPL")
      expect(response).to be_a(Hash) # Adjust based on the actual API response
    end
  end

  describe "#get_ticker_eod" do
    before { allow(client).to receive(:make_request).and_return([]) }

    it "fetches the end-of-day data for a specific ticker" do
      response = client.get_ticker_eod("AAPL")
      expect(response).to be_a(Array) # Adjust based on the actual API response
    end
  end

  describe "#get_ticker_intraday" do
    before { allow(client).to receive(:make_request).and_return([]) }

    it "fetches the intraday and real-time data for a specific ticker" do
      response = client.get_ticker_intraday("AAPL")
      expect(response).to be_a(Array) # Adjust based on the actual API response
    end
  end

  describe "#get_ticker_latest_intraday" do
    before { allow(client).to receive(:make_request).and_return({}) }

    it "fetches the latest intraday data for a specific ticker" do
      response = client.get_ticker_latest_intraday("AAPL")
      expect(response).to be_a(Hash) # Adjust based on the actual API response
    end
  end

  describe "#get_ticker_latest_eod" do
    before { allow(client).to receive(:make_request).and_return({}) }

    it "fetches the latest end-of-day data for a specific ticker" do
      response = client.get_ticker_latest_eod("AAPL")
      expect(response).to be_a(Hash) # Adjust based on the actual API response
    end
  end

  describe "#get_historical_data" do
    before { allow(client).to receive(:make_request).and_return([]) }

    it "fetches the historical data for a specific ticker" do
      response = client.get_historical_data(symbol: "AAPL", date_from: "2020-01-01", date_to: "2020-01-31")
      expect(response).to be_a(Array) # Adjust based on the actual API response
    end
  end

  describe "#get_multiple_historical_data" do
    before { allow(client).to receive(:make_request).and_return([]) }

    it "fetches the historical data for multiple tickers" do
      response = client.get_multiple_historical_data(symbols: %w[AAPL MSFT], date_from: "2020-01-01", date_to: "2020-01-31")
      expect(response).to be_a(Array) # Adjust based on the actual API response
    end
  end
end
