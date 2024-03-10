require "test_helper"

class RepairmenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repairman = repairmen(:one)
  end

  test "should get index" do
    get repairmen_url
    assert_response :success
  end

  test "should get new" do
    get new_repairman_url
    assert_response :success
  end

  test "should create repairman" do
    assert_difference("Repairman.count") do
      post repairmen_url, params: { repairman: { age: @repairman.age, first_name: @repairman.first_name, location: @repairman.location, password: @repairman.password, password_confirmation: @repairman.password_confirmation, second_name: @repairman.second_name, terms: @repairman.terms } }
    end

    assert_redirected_to repairman_url(Repairman.last)
  end

  test "should show repairman" do
    get repairman_url(@repairman)
    assert_response :success
  end

  test "should get edit" do
    get edit_repairman_url(@repairman)
    assert_response :success
  end

  test "should update repairman" do
    patch repairman_url(@repairman), params: { repairman: { age: @repairman.age, first_name: @repairman.first_name, location: @repairman.location, password: @repairman.password, password_confirmation: @repairman.password_confirmation, second_name: @repairman.second_name, terms: @repairman.terms } }
    assert_redirected_to repairman_url(@repairman)
  end

  test "should destroy repairman" do
    assert_difference("Repairman.count", -1) do
      delete repairman_url(@repairman)
    end

    assert_redirected_to repairmen_url
  end
end
