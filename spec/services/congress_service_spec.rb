require 'rails_helper'

RSpec.describe 'CongressService' do
  context 'happy path' do
    it 'retrieves data and parses response', :vcr do
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
  end
end
