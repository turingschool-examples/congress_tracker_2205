class CongressService

  def self.search_house(state)
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end
    # using connection, make a GET request with specific path
    #
    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    # Data processing: getting the "meat" of the response
    JSON.parse(response.body, symbolize_names: true)
  end
end