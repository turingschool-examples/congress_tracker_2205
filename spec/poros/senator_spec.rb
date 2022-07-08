require 'rails_helper'

RSpec.describe Senator do
  it 'properly populates attributes from JSON data to create a Senator' do
    data = {
      "first_name": "Tammy",
      "last_name": "Duckworth",
      "twitter_account": "SenDuckworth"
    }

    senator = Senator.new(data)

    expect(senator).to be_a(Senator)
    expect(senator.first_name).to eq(data[:first_name])
    expect(senator.last_name).to eq(data[:last_name])
    expect(senator.twitter_account).to eq(data[:twitter_account])
  end
end
