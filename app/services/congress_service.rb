class CongressService

  def self.search_house_by_state(state)
    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_senate
    response = conn.get("/congress/v1/116/senate/members.json")

    if response.status == 200
      JSON.parse(response.body, symbolize_names: true)
    else
      nil
    end
  end

  private

  def self.conn
    Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end
  end
end