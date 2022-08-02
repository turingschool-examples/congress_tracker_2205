class CongressFacade

  def self.search_house_members(state)
    parsed_json = CongressService.search_house_by_state(state)

    parsed_json[:results].map do |member_json|
      Member.new(member_json)
    end
  end

  def self.senate_members
    response = conn.get("/congress/v1/116/senate/members.json")

    data = JSON.parse(response.body, symbolize_names: true)
    data[:results][0][:members]
  end

  def self.search_senate(query)
    members = CongressService.search_senate[:results][0][:members]
    found_members = members.find_all { |m| m[:last_name] == query }

    return nil unless found_members.present?

    Member.new(found_members.first)
  end

end
