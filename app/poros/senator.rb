class Senator
  attr_reader :first_name,
              :last_name,
              :twitter_account

  def initialize(data)
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @twitter_account = data[:twitter_account]
  end
end