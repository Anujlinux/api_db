require "test_helper"

class SrctypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @srctype = srctypes(:one)
  end

  test "should get index" do
    get srctypes_url
    assert_response :success
  end

  test "should get new" do
    get new_srctype_url
    assert_response :success
  end

  test "should create srctype" do
    assert_difference('Srctype.count') do
      post srctypes_url, params: { srctype: { has_many: @srctype.has_many, name: @srctype.name } }
    end

    assert_redirected_to srctype_url(Srctype.last)
  end

  test "should show srctype" do
    get srctype_url(@srctype)
    assert_response :success
  end

  test "should get edit" do
    get edit_srctype_url(@srctype)
    assert_response :success
  end

  test "should update srctype" do
    patch srctype_url(@srctype), params: { srctype: { has_many: @srctype.has_many, name: @srctype.name } }
    assert_redirected_to srctype_url(@srctype)
  end

  test "should destroy srctype" do
    assert_difference('Srctype.count', -1) do
      delete srctype_url(@srctype)
    end

    assert_redirected_to srctypes_url
  end
end
