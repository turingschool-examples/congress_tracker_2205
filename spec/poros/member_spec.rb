require 'rails_helper'

RSpec.describe Member do
  # input -> JSON member response
  # output -> Member object
  it 'populates Member fields from JSON response' do
    data = {
      "id": "D000197",
      "name": "Diana DeGette",
      "first_name": "Diana",
      "middle_name": nil,
      "last_name": "DeGette",
      "suffix": nil,
      "role": "Representative",
      "gender": "F",
      "party": "D",
      "times_topics_url": nil,
      "twitter_id": "RepDianaDeGette",
      "facebook_account": "DianaDeGette",
      "youtube_id": "RepDianaDeGette",
      "seniority": "26",
      "next_election": "2022",
      "api_uri": "https://api.propublica.org/congress/v1/members/D000197.json",
      "district": "1",
      "at_large": false
    }

    # Other option: read from fixture file
    # data = JSON.parse(File.read('./spec/fixtures/single_member.json'), symbolize_names: true)

    member = Member.new(data)

    expect(member).to be_a Member
    expect(member.name).to eq(data[:name])
    expect(member.role).to eq(data[:role])
    expect(member.party).to eq(data[:party])
    expect(member.district).to eq(data[:district])
  end
end
