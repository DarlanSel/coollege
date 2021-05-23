require "test_helper"

class SubjectClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subject_classes_index_url
    assert_response :success
  end

  test "should get new" do
    get subject_classes_new_url
    assert_response :success
  end

  test "should get show" do
    get subject_classes_show_url
    assert_response :success
  end

  test "should get edit" do
    get subject_classes_edit_url
    assert_response :success
  end
end
