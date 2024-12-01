require "faraday"
require "json"

module MarketstackWrapper
  class Client
    BASE_URI = "http://api.marketstack.com/v1/"

    # Initialize the client
    # @param access_key [String] The API access key
    def initialize(access_key)
      @access_key = access_key
      @connection = Faraday.new(url: BASE_URI)
    end

    # Fetch all tickers
    # @param limit [Integer] The number of tickers to fetch
    # @param offset [Integer] The offset to start fetching tickers
    def get_all_tickers(limit: nil, offset: nil)
      make_request("tickers", { limit: limit, offset: offset })
    end

    # Fetch a specific ticker
    # @param symbol [String] The ticker symbol
    def get_ticker(symbol)
      make_request("tickers/#{symbol}")
    end

    # Fetch the end-of-day data for a specific ticker
    # @param symbol [String] The ticker symbol
    # @param limit [Integer] The number of data points to fetch
    def get_ticker_eod(symbol, limit: nil, offset: nil)
      make_request("tickers/#{symbol}/eod", { limit: limit, offset: offset })
    end

    # Fetch the intraday and real-time data for a specific ticker
    # @param symbol [String] The ticker symbol
    # @param limit [Integer] The number of data points to fetch
    def get_ticker_intraday(symbol, limit: nil, offset: nil)
      make_request("tickers/#{symbol}/intraday", { limit: limit, offset: offset })
    end

    # Fetch the latest intraday data for a specific ticker
    # @param symbol [String] The ticker symbol
    def get_ticker_latest_intraday(symbol)
      make_request("tickers/#{symbol}/intraday/latest")
    end

    # Fetch the latest end-of-day data for a specific ticker
    # @param symbol [String] The ticker symbol
    def get_ticker_latest_eod(symbol)
      make_request("tickers/#{symbol}/eod/latest")
    end

    # Fetch the historical data for a specific ticker
    # @param symbol [String] The ticker symbol
    # @param date_from [String] The start date for the historical data (YYYY-MM-DD)
    # @param date_to [String] The end date for the historical data (YYYY-MM-DD)
    # @param limit [Integer] The number of data points to fetch
    # @param offset [Integer] The offset to start fetching data points
    def get_historical_data(symbol:, date_from:, date_to:, limit: nil, offset: nil)
      make_request(
        "eod",
        { symbol: symbol, date_from: date_from, date_to: date_to, limit: limit, offset: offset }
      )
    end

    # Fetch the historical data for multiple tickers
    # @param symbols [Array<String>] The ticker symbols
    # @param date_from [String] The start date for the historical data (YYYY-MM-DD)
    # @param date_to [String] The end date for the historical data (YYYY-MM-DD)
    # @param limit [Integer] The number of data points to fetch
    # @param offset [Integer] The offset to start fetching data points
    def get_multiple_historical_data(symbols:, date_from:, date_to:, limit: nil, offset: nil)
      make_request(
        "eod",
        { symbols: symbols.join(","), date_from: date_from, date_to: date_to, limit: limit, offset: offset }
      )
    end

    private

    def make_request(endpoint, params = {})
      params[:access_key] = @access_key
      response = @connection.get(endpoint, params)
      parse_response(response)
    end

    def parse_response(response)
      if response.success?
        JSON.parse(response.body)
      else
        raise "Error: #{response.status} - #{response.body}"
      end
    end
  end
end
