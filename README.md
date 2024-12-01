MarketStack Wrapper
===================

**marketstack\_wrapper** is a Ruby gem that provides a simple interface for accessing the [MarketStack API](https://marketstack.com/documentation). The API offers stock market data including tickers, historical data, intraday data, and more.

Features
--------

*   Fetch all available tickers
    
*   Retrieve data for a specific ticker
    
*   Access end-of-day (EOD) or intraday stock prices
    
*   Fetch historical data for single or multiple tickers
    
*   Pagination support for large datasets
    

Installation
------------

Add the gem to your Gemfile:

```
gem 'marketstack_wrapper'
```

Then, run:

```
bundle install
```

Alternatively, install it directly:

```
gem install marketstack_wrapper
```

Configuration
-------------

To use the gem, you need an API key from [MarketStack](https://marketstack.com). Sign up for a free or paid plan to get your access\_key.

Usage
-----

Here’s how you can use the gem to interact with the MarketStack API:

### Initialization

```
require 'marketstack_wrapper'  # Initialize the client with your API key  client = MarketstackWrapper::Client.new('your_access_key')
```

### Fetch All Tickers

```
tickers = client.get_all_tickers(limit: 10, offset: 0)
puts tickers
```

### Get Data for a Specific Ticker

```
ticker = client.get_ticker('AAPL')
puts ticker
```

### Fetch End-of-Day (EOD) Data for a Ticker

```
eod_data = client.get_ticker_eod('AAPL', limit: 5)
puts eod_data
```

### Fetch Intraday Data for a Ticker

```
intraday_data = client.get_ticker_intraday('AAPL', limit: 5)
puts intraday_data
```

### Fetch Latest Intraday Data for a Ticker

```
latest_intraday = client.get_ticker_latest_intraday('AAPL')
puts latest_intraday
```

### Fetch Latest End-of-Day Data for a Ticker

```
latest_eod = client.get_ticker_latest_eod('AAPL')
puts latest_eod
```

### Fetch Historical Data for a Ticker

```
historical_data = client.get_historical_data(symbol: 'AAPL', date_from: '2023-01-01', date_to: '2023-02-01', limit: 10)
puts historical_data
```

### Fetch Historical Data for Multiple Tickers

```
multi_historical = client.get_multiple_historical_data(symbols: ['AAPL', 'GOOG', 'MSFT'], date_from: '2023-01-01', date_to: '2023-02-01', limit: 10)
puts multi_historical
```

Pagination
----------

All endpoints support pagination with limit and offset parameters. Adjust these to retrieve more results when necessary.

Error Handling
--------------

The gem raises exceptions if the API response indicates an error (e.g., invalid API key, rate limit exceeded). Make sure to handle these exceptions in your code:

```
begin
  tickers = client.get_all_tickers
rescue => e
  puts "An error occurred: #{e.message}"
end
```

Development
-----------

Contributions are welcome! To get started with development:

1.  Clone the repository
```
git clone https://github.com/yourusername/marketstack\_wrapper.gitcd marketstack\_wrapper
```
2.  Install the dependencies
```
bundle install
``` 
3.  Run tests
```
rspec
```

Contributing
------------

1.  Fork the repository.
    
2.  Create a new feature branch

```
git checkout -b my-feature-branch
``` 
3.  Commit your changes:
```
git commit -m "Add my new feature"
```
4.  Push to your branch:
```
git push origin my-feature-branch
```
5.  Open a pull request on GitHub.
    

License
-------

This project is licensed under the MIT License. See the LICENSE file for details.
