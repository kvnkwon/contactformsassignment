require 'spec_helper'

feature "Admin visits the inquiries page" do
  # As an admin
  # I want to review contact inquiries
  # So that I can respond or take action
  #
  # Acceptance Criteria:
  #
  # I can see a list of all contact inquiries

  it "sees a title" do
    visit '/inquiries'
    expect(page).to have_content "Listing inquiries"
  end

  it "sees all the inquiries listed on the page" do
    # Create two inquiries so we can test that they're displayed on the page
    inquiry1 = FactoryGirl.create(:inquiry)
    inquiry2 = FactoryGirl.create(:inquiry)

    visit '/inquiries'

    expect_to_see_inquiry(inquiry1)
    expect_to_see_inquiry(inquiry2)
  end

  def expect_to_see_inquiry(inquiry)
    expect(page).to have_content inquiry.email
    expect(page).to have_content inquiry.subject
    expect(page).to have_content inquiry.description
    expect(page).to have_content inquiry.first_name
    expect(page).to have_content inquiry.last_name
  end
end