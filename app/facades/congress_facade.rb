class CongressFacade
  def self.members(state)
    json = CongressService.search_house(state)

    json[:results].map do |member_data|
      Member.new(member_data)
    end
  end
end