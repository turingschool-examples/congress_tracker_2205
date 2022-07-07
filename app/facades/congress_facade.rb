class CongressFacade

  def self.search_house_members(state)
    parsed_json = CongressService.search_house_by_state(state)

    parsed_json[:results].map do |member_json|
      Member.new(member_json)
    end
  end

end