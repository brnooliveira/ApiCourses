require "test_helper"

class CourseenrollmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get courseenrollment_index_url
    assert_response :success
  end

  test "should get create" do
    get courseenrollment_create_url
    assert_response :success
  end
end
