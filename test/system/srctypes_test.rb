require "application_system_test_case"

class SrctypesTest < ApplicationSystemTestCase
  setup do
    @srctype = srctypes(:one)
  end

  test "visiting the index" do
    visit srctypes_url
    assert_selector "h1", text: "Srctypes"
  end

  test "creating a Srctype" do
    visit srctypes_url
    click_on "New Srctype"

    fill_in "Has many", with: @srctype.has_many
    fill_in "Name", with: @srctype.name
    click_on "Create Srctype"

    assert_text "Srctype was successfully created"
    click_on "Back"
  end

  test "updating a Srctype" do
    visit srctypes_url
    click_on "Edit", match: :first

    fill_in "Has many", with: @srctype.has_many
    fill_in "Name", with: @srctype.name
    click_on "Update Srctype"

    assert_text "Srctype was successfully updated"
    click_on "Back"
  end

  test "destroying a Srctype" do
    visit srctypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Srctype was successfully destroyed"
  end
end
