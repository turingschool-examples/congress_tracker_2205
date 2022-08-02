class Member
  attr_reader :name,
              :role,
              :party,
              :district,
              :first_name,
              :last_name,
              :twitter_account

  def initialize(attributes)
    @name = attributes[:name]
    @role = attributes[:role]
    @party = attributes[:party]
    @district = attributes[:district]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @twitter_account = attributes[:twitter_account]
  end
end
