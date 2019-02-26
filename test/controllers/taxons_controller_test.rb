require 'test_helper'

class TaxonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get taxons_new_url
    assert_response :success
  end

end
