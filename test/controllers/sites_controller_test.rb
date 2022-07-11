require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site = sites(:one)
  end

  test "should get index" do
    get sites_url
    assert_response :success
  end

  test "should get new" do
    get new_site_url
    assert_response :success
  end

  test "should create site" do
    assert_difference('Site.count') do
      post sites_url, params: { site: { contact: @site.contact, head_office: @site.head_office, invoice: @site.invoice, invoice_address: @site.invoice_address, invoice_email: @site.invoice_email, name: @site.name, number: @site.number, payment_method: @site.payment_method, post_code: @site.post_code, street_address_one: @site.street_address_one, street_address_two: @site.street_address_two, town: @site.town } }
    end

    assert_redirected_to site_url(Site.last)
  end

  test "should show site" do
    get site_url(@site)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_url(@site)
    assert_response :success
  end

  test "should update site" do
    patch site_url(@site), params: { site: { contact: @site.contact, head_office: @site.head_office, invoice: @site.invoice, invoice_address: @site.invoice_address, invoice_email: @site.invoice_email, name: @site.name, number: @site.number, payment_method: @site.payment_method, post_code: @site.post_code, street_address_one: @site.street_address_one, street_address_two: @site.street_address_two, town: @site.town } }
    assert_redirected_to site_url(@site)
  end

  test "should destroy site" do
    assert_difference('Site.count', -1) do
      delete site_url(@site)
    end

    assert_redirected_to sites_url
  end
end
