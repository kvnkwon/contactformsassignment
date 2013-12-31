require 'spec_helper'

feature "Admin deletes unwanted inquiries" do
  # As an admin
  # I want to delete an inquiry
  # So that I can remove spam or other undesirable inquiries
  #
  # Acceptance Criteria:
  #
  # I can remove an item from the listing of contact inquiries

  it "deletes an inquiry" do
    inquiry1 = FactoryGirl.create(:inquiry)
    inquiry2 = FactoryGirl.create(:inquiry)
    visit '/inquiries'
    save_and_open_page
    within("#inquiry-#{inquiry2.id}") do
      click_on "Destroy"
    end
  end
end