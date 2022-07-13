require "application_system_test_case"

class ContactsTest < ApplicationSystemTestCase
  setup do
    @contact = contacts(:one)
  end

  test "visiting the index" do
    visit contacts_url
    assert_selector "h1", text: "Contacts"
  end

  test "creating a Contact" do
    visit contacts_url
    click_on "New Contact"

    fill_in "Buyer", with: @contact.buyer
    fill_in "Email", with: @contact.email
    fill_in "First name", with: @contact.first_name
    fill_in "Head office", with: @contact.head_office
    fill_in "Invoice", with: @contact.invoice
    fill_in "Last name", with: @contact.last_name
    fill_in "Number", with: @contact.number
    fill_in "Phone number", with: @contact.phone_number
    fill_in "Post code string", with: @contact.post_code_string
    fill_in "Site", with: @contact.site_id
    fill_in "Street address1", with: @contact.street_address1
    fill_in "Street address2", with: @contact.street_address2
    fill_in "Title", with: @contact.title
    fill_in "Town", with: @contact.town
    click_on "Create Contact"

    assert_text "Contact was successfully created"
    click_on "Back"
  end

  test "updating a Contact" do
    visit contacts_url
    click_on "Edit", match: :first

    fill_in "Buyer", with: @contact.buyer
    fill_in "Email", with: @contact.email
    fill_in "First name", with: @contact.first_name
    fill_in "Head office", with: @contact.head_office
    fill_in "Invoice", with: @contact.invoice
    fill_in "Last name", with: @contact.last_name
    fill_in "Number", with: @contact.number
    fill_in "Phone number", with: @contact.phone_number
    fill_in "Post code string", with: @contact.post_code_string
    fill_in "Site", with: @contact.site_id
    fill_in "Street address1", with: @contact.street_address1
    fill_in "Street address2", with: @contact.street_address2
    fill_in "Title", with: @contact.title
    fill_in "Town", with: @contact.town
    click_on "Update Contact"

    assert_text "Contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact" do
    visit contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact was successfully destroyed"
  end
end
