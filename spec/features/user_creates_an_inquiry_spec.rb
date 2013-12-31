require 'spec_helper'

feature "User creates an Inquiry" do

  # Acceptance Criteria:
  # I must specify a valid email address
  # I must specify a subject
  # I must specify a description
  # I must specify a first name
  # I must specify a last name

  context "with valid attributes" do
    it "creates an Inquiry with valid attributes" do
      visit '/inquiries/new'

      fill_in "Email", with: "kwon@email.com"
      fill_in "Subject", with: "Awesome"
      fill_in "Description", with: "You guys are great!"
      fill_in "First name", with: "Kevin"
      fill_in "Last name", with: "Kwon"
      click_on "Create Inquiry"

      expect(page).to have_content "Inquiry was successfully created"
    end
  end

  context "with invalid attributes" do
    it "sees errors for invalid attributes" do
      visit '/inquiries/new'

      click_on "Create Inquiry"
      expect(page).to have_content "Email is invalid"
      expect(page).to have_content "Subject can't be blank"
      expect(page).to have_content "Description can't be blank"
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
    end
  end
end