require 'rails_helper'
RSpec.describe 'State House Member Search' do
  describe 'happy path' do
    it 'allows user to search for house members by state' do
      VCR.use_cassette('propublica_members_of_the_house_by_state') do
        visit root_path

        select "Colorado", :from => "state"
        click_button 'Search By State'

        expect(page.status_code).to eq 200
        expect(page).to have_content("7 Results")
        expect(page).to have_content("Joe Neguse")
        expect(page).to have_content("Ed Perlmutter")
      end
    end
  end
end
