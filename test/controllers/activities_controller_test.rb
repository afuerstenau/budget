require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plannedtransaction = plannedtransaction(:one)
  end

  test "should get index" do
    get plannedtransaction_url
    assert_response :success
  end

  test "should get new" do
    get new_plannedtransaction_url
    assert_response :success
  end

  test "should create plannedtransaction" do
    assert_difference('Activity.count') do
      post plannedtransaction_url, params: { plannedtransaction: { amount: @plannedtransaction.amount, category_id: @plannedtransaction.category_id, months: @plannedtransaction.months, name: @plannedtransaction.name, repeat_yearly: @plannedtransaction.repeat_yearly } }
    end

    assert_redirected_to plannedtransaction_url(Activity.last)
  end

  test "should show plannedtransaction" do
    get plannedtransaction_url(@plannedtransaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_plannedtransaction_url(@plannedtransaction)
    assert_response :success
  end

  test "should update plannedtransaction" do
    patch plannedtransaction_url(@plannedtransaction), params: { plannedtransaction: { amount: @plannedtransaction.amount, category_id: @plannedtransaction.category_id, months: @plannedtransaction.months, name: @plannedtransaction.name, repeat_yearly: @plannedtransaction.repeat_yearly } }
    assert_redirected_to plannedtransaction_url(@plannedtransaction)
  end

  test "should destroy plannedtransaction" do
    assert_difference('Activity.count', -1) do
      delete plannedtransaction_url(@plannedtransaction)
    end

    assert_redirected_to plannedtransaction_url
  end
end
