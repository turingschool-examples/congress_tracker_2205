require 'rails_helper'

# input: state variable
# output: parsed JSON of house members from API
RSpec.describe 'CongressService' do
  it 'retrieves house member data by state and parses response', :vcr do
    parsed_json = CongressService.search_house('CO')

    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array
    member_data = parsed_json[:results][0]
    expect(member_data).to include(:name, :role, :party, :district)
    expect(member_data[:name]).to be_a String
    expect(member_data[:role]).to be_a String
    expect(member_data[:district]).to be_a String
    expect(member_data[:party]).to be_a String
  end
end