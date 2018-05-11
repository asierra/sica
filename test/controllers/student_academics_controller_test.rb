require 'test_helper'

class StudentAcademicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_academic = student_academics(:one)
  end

  test "should get index" do
    get student_academics_url
    assert_response :success
  end

  test "should get new" do
    get new_student_academic_url
    assert_response :success
  end

  test "should create student_academic" do
    assert_difference('StudentAcademic.count') do
      post student_academics_url, params: { student_academic: { academic_id: @student_academic.academic_id, activity_id: @student_academic.activity_id, student_id: @student_academic.student_id } }
    end

    assert_redirected_to student_academic_url(StudentAcademic.last)
  end

  test "should show student_academic" do
    get student_academic_url(@student_academic)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_academic_url(@student_academic)
    assert_response :success
  end

  test "should update student_academic" do
    patch student_academic_url(@student_academic), params: { student_academic: { academic_id: @student_academic.academic_id, activity_id: @student_academic.activity_id, student_id: @student_academic.student_id } }
    assert_redirected_to student_academic_url(@student_academic)
  end

  test "should destroy student_academic" do
    assert_difference('StudentAcademic.count', -1) do
      delete student_academic_url(@student_academic)
    end

    assert_redirected_to student_academics_url
  end
end
