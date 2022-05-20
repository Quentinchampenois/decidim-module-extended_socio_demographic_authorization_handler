# frozen_string_literal: true

require "spec_helper"

describe "User authorizations", type: :system do
  include Decidim::TranslatableAttributes

  let!(:organization) do
    create(:organization,
           available_authorizations: ["extended_socio_demographic_authorization_handler"])
  end

  let(:user) { create(:user, :confirmed) }

  before do
    switch_to_host(organization.host)
    login_as user, scope: :user
    visit decidim.root_path
    click_link user.name
    click_link "My account"
    click_link "Authorizations"
  end

  it "displays the authorization item" do
    within ".tabs-content.vertical" do
      expect(page).to have_content("Additional informations")
    end
  end

  context "when accessing authorization" do
    before do
      visit "/authorizations"

      click_link "Additional informations"
    end

    it "displays authorization form" do
      expect(page).to have_content "Additional informations"

      within ".new_authorization_handler" do
        expect(page).to have_content("Last name")
        expect(page).to have_field("First name")
        expect(page).to have_field("Address")
        expect(page).to have_field("Postal code")
        expect(page).to have_field("City")
        expect(page).to have_field("Email")
      end
    end

    it "allows user to fill form" do
      fill_in :authorization_handler_last_name, with: "Doe"
      fill_in :authorization_handler_first_name, with: "John"
      fill_in :authorization_handler_address, with: "21 Jump Street"
      fill_in :authorization_handler_postal_code, with: "1234"
      fill_in :authorization_handler_city, with: "Nowhere"
      fill_in :authorization_handler_email, with: "user@example.org"
      click_button "Send"

      expect(page).to have_content("You've been successfully authorized")
    end
  end
end
