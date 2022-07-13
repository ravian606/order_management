require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { buyer: @contact.buyer, email: @contact.email, first_name: @contact.first_name, head_office: @contact.head_office, invoice: @contact.invoice, last_name: @contact.last_name, number: @contact.number, phone_number: @contact.phone_number, post_code_string: @contact.post_code_string, site_id: @contact.site_id, street_address1: @contact.street_address1, street_address2: @contact.street_address2, title: @contact.title, town: @contact.town } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { buyer: @contact.buyer, email: @contact.email, first_name: @contact.first_name, head_office: @contact.head_office, invoice: @contact.invoice, last_name: @contact.last_name, number: @contact.number, phone_number: @contact.phone_number, post_code_string: @contact.post_code_string, site_id: @contact.site_id, street_address1: @contact.street_address1, street_address2: @contact.street_address2, title: @contact.title, town: @contact.town } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
