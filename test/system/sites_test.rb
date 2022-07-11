require "application_system_test_case"

class SitesTest < ApplicationSystemTestCase
  setup do
    @site = sites(:one)
  end

  test "visiting the index" do
    visit sites_url
    assert_selector "h1", text: "Sites"
  end

  test "creating a Site" do
    visit sites_url
    click_on "New Site"

    fill_in "Contact", with: @site.contact
    fill_in "Head office", with: @site.head_office
    fill_in "Invoice", with: @site.invoice
    fill_in "Invoice address", with: @site.invoice_address
    fill_in "Invoice email", with: @site.invoice_email
    fill_in "Name", with: @site.name
    fill_in "Number", with: @site.number
    fill_in "Payment method", with: @site.payment_method
    fill_in "Post code", with: @site.post_code
    fill_in "Street address one", with: @site.street_address_one
    fill_in "Street address two", with: @site.street_address_two
    fill_in "Town", with: @site.town
    click_on "Create Site"

    assert_text "Site was successfully created"
    click_on "Back"
  end

  test "updating a Site" do
    visit sites_url
    click_on "Edit", match: :first

    fill_in "Contact", with: @site.contact
    fill_in "Head office", with: @site.head_office
    fill_in "Invoice", with: @site.invoice
    fill_in "Invoice address", with: @site.invoice_address
    fill_in "Invoice email", with: @site.invoice_email
    fill_in "Name", with: @site.name
    fill_in "Number", with: @site.number
    fill_in "Payment method", with: @site.payment_method
    fill_in "Post code", with: @site.post_code
    fill_in "Street address one", with: @site.street_address_one
    fill_in "Street address two", with: @site.street_address_two
    fill_in "Town", with: @site.town
    click_on "Update Site"

    assert_text "Site was successfully updated"
    click_on "Back"
  end

  test "destroying a Site" do
    visit sites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Site was successfully destroyed"
  end
end
