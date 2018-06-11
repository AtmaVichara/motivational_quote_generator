class QuoteGeneratorService

  def initialize
  end

  def get_quotes_and_authors
    get_url("/?cat=famous&count=10")
  end

  private

    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def headers
      {
        'Accept' => 'application/json',
        'X-Mashape-Key' => ENV['API_KEY'],
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
    end

    def conn
      Faraday.new(url: 'https://andruxnet-random-famous-quotes.p.mashape.com', headers: headers)
    end

end
