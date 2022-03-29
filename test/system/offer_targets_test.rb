require "application_system_test_case"

class OfferTargetsTest < ApplicationSystemTestCase
  setup do
    @offer_target = offer_targets(:os_version_conditional)
  end

  test "visiting the index" do
    visit offer_targets_url
    assert_selector "h1", text: "Offer targets"
  end

  # test "should create offer target" do
  #   visit offer_targets_url
  #   click_on "New offer target"
  #
  #   fill_in "Gender", with: @offer_target.gender_id
  #   fill_in "Locale Id", with: @offer_target.locale_id
  #   fill_in "Max player age", with: @offer_target.max_player_age
  #   fill_in "Min os major version", with: @offer_target.min_os_major_version
  #   fill_in "Min os minor version", with: @offer_target.min_os_minor_version
  #   fill_in "Min os patch version", with: @offer_target.min_os_patch_version
  #   fill_in "Min player age", with: @offer_target.min_player_age
  #   fill_in "Offer", with: @offer_target.offer_id
  #   fill_in "Operating system", with: @offer_target.operating_system_id
  #   click_on "Create Offer target"
  #
  #   assert_text "Offer target was successfully created"
  #   click_on "Back"
  # end

  # test "should update Offer target" do
  #   visit offer_target_url(@offer_target)
  #   click_on "Edit this offer target", match: :first
  #
  #   fill_in "Gender", with: @offer_target.gender_id
  #   fill_in "Locale Id", with: @offer_target.locale_id
  #   fill_in "Max player age", with: @offer_target.max_player_age
  #   fill_in "Min os major version", with: @offer_target.min_os_major_version
  #   fill_in "Min os minor version", with: @offer_target.min_os_minor_version
  #   fill_in "Min os patch version", with: @offer_target.min_os_patch_version
  #   fill_in "Min player age", with: @offer_target.min_player_age
  #   fill_in "Offer", with: @offer_target.offer_id
  #   fill_in "Operating system", with: @offer_target.operating_system_id
  #   click_on "Update Offer target"
  #
  #   assert_text "Offer target was successfully updated"
  #   click_on "Back"
  # end

  test "should destroy Offer target" do
    visit offer_target_url(@offer_target)
    click_on "Destroy this offer target", match: :first

    assert_text "Offer target was successfully destroyed"
  end
end
