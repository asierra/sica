require 'test_helper'

class StudentScholarshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_scholarship = student_scholarships(:one)
  end

  test "should get index" do
    get student_scholarships_url
    assert_response :success
  end

  test "should get new" do
    get new_student_scholarship_url
    assert_response :success
  end

  test "should create student_scholarship" do
    assert_difference('StudentScholarship.count') do
      post student_scholarships_url, params: { student_scholarship: { scholarship_id: @student_scholarship.scholarship_id, student_id: @student_scholarship.student_id } }
    end

    assert_redirected_to student_scholarship_url(StudentScholarship.last)
  end

  test "should show student_scholarship" do
    get student_scholarship_url(@student_scholarship)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_scholarship_url(@student_scholarship)
    assert_response :success
  end

  test "should update student_scholarship" do
    patch student_scholarship_url(@student_scholarship), params: { student_scholarship: { scholarship_id: @student_scholarship.scholarship_id, student_id: @student_scholarship.student_id } }
    assert_redirected_to student_scholarship_url(@student_scholarship)
  end

  test "should destroy student_scholarship" do
    assert_difference('StudentScholarship.count', -1) do
      delete student_scholarship_url(@student_scholarship)
    end

    assert_redirected_to student_scholarships_url
  end
end
