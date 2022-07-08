require 'rails_helper'

RSpec.describe 'CongressFacade' do
  # input -> state: 'CO'
  # output -> array of POROs
  # facade: reaching out to services, creating objects, returning the data
  describe '#search_house_members' do

    context 'one testing option - integration' do
      it 'makes services call and returns an array of member objects', :vcr do
        members = CongressFacade.search_house_members('CO')

        expect(members).to be_a Array
        expect(members).to be_all Member
      end
    end

    context 'another option - unit' do
      it 'returns an array of member objects' do
        data = File.read('spec/fixtures/members_of_the_house.json')
        parsed_data = JSON.parse(data, symbolize_names: true)

        allow(CongressService).to receive(:search_house_by_state).and_return(parsed_data)

        members = CongressFacade.search_house_members('CO')

        expect(members).to be_a Array
        expect(members).to be_all Member
      end
    end
  end

  describe '#search_senate' do
    it 'should return one senator based on search terms' do
      data = File.read('spec/fixtures/members_of_the_senate.json')
      parsed_data = JSON.parse(data, symbolize_names: true)

      allow(CongressService).to receive(:search_senate).and_return(parsed_data)
      senator = CongressFacade.search_senate('Duckworth')
      expect(senator).to be_a Senator
    end

    it 'should return nil if service does not return data' do
      allow(CongressService).to receive(:search_senate).and_return(nil)
      senator = CongressFacade.search_senate('Unknown Senator')
      expect(senator).to be_nil
    end
  end
end
