class CongressFacade

  def self.search_house_members(state)
    parsed_json = CongressService.search_house_by_state(state)

    parsed_json[:results].map do |member_json|
      Member.new(member_json)
    end
  end

  def self.search_senate(search_term)
    data = CongressService.search_senate
    if data != nil
      members = data[:results][0][:members]

      found_members = members.find_all { |m| m[:last_name] == search_term }
      Senator.new(found_members.first)
    else
      nil
    end
  end

end