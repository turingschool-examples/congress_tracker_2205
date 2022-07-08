require 'rails_helper'

RSpec.describe 'CongressService' do
  context 'happy path' do
    it 'retrieves house member data and parses response', :vcr do
      # input -> state string 'CO'
      # output -> parsed json

      parsed_json = CongressService.search_house_by_state('CO')

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:results]).to be_a Array

      member = parsed_json[:results].first
      expect(member).to include :name, :role, :party, :district
      expect(member[:name]).to be_a(String)
      expect(member[:role]).to be_a(String)
      expect(member[:party]).to be_a(String)
      expect(member[:district]).to be_a(String)
    end

    it 'retrieves senate member data and parses response', :vcr do
      parsed_json = CongressService.search_senate

      expect(parsed_json).to be_a Hash
      expect(parsed_json[:results]).to be_a Array

      senator = parsed_json[:results][0][:members].first
      expect(senator).to include :first_name, :last_name, :twitter_account
      expect(senator[:first_name]).to be_a String
      expect(senator[:last_name]).to be_a String
      expect(senator[:twitter_account]).to be_a String
    end
  end

  context 'sad path - more advanced testing option' do
    it 'should return nil when external API does not return 200' do
      stub_request(:get, 'https://api.propublica.org/congress/v1/116/senate/members.json')
        .to_return(status: 500, body: '', headers: {})

      response = CongressService.search_senate

      expect(response).to be_nil
    end
  end
end
