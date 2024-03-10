require "application_system_test_case"

class RepairmenTest < ApplicationSystemTestCase
  setup do
    @repairman = repairmen(:one)
  end

  test "visiting the index" do
    visit repairmen_url
    assert_selector "h1", text: "Repairmen"
  end

  test "should create repairman" do
    visit repairmen_url
    click_on "New repairman"

    fill_in "Age", with: @repairman.age
    fill_in "First name", with: @repairman.first_name
    fill_in "Location", with: @repairman.location
    fill_in "Password", with: @repairman.password
    fill_in "Password confirmation", with: @repairman.password_confirmation
    fill_in "Second name", with: @repairman.second_name
    check "Terms" if @repairman.terms
    click_on "Create Repairman"

    assert_text "Repairman was successfully created"
    click_on "Back"
  end

  test "should update Repairman" do
    visit repairman_url(@repairman)
    click_on "Edit this repairman", match: :first

    fill_in "Age", with: @repairman.age
    fill_in "First name", with: @repairman.first_name
    fill_in "Location", with: @repairman.location
    fill_in "Password", with: @repairman.password
    fill_in "Password confirmation", with: @repairman.password_confirmation
    fill_in "Second name", with: @repairman.second_name
    check "Terms" if @repairman.terms
    click_on "Update Repairman"

    assert_text "Repairman was successfully updated"
    click_on "Back"
  end

  test "should destroy Repairman" do
    visit repairman_url(@repairman)
    click_on "Destroy this repairman", match: :first

    assert_text "Repairman was successfully destroyed"
  end
end
