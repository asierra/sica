require 'test_helper'

class StudentEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_entry = student_entries(:one)
  end

  test "should get index" do
    get student_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_student_entry_url
    assert_response :success
  end

  test "should create student_entry" do
    assert_difference('StudentEntry.count') do
      post student_entries_url, params: { student_entry: { entry: @student_entry.entry, student_id: @student_entry.student_id } }
    end

    assert_redirected_to student_entry_url(StudentEntry.last)
  end

  test "should show student_entry" do
    get student_entry_url(@student_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_entry_url(@student_entry)
    assert_response :success
  end

  test "should update student_entry" do
    patch student_entry_url(@student_entry), params: { student_entry: { entry: @student_entry.entry, student_id: @student_entry.student_id } }
    assert_redirected_to student_entry_url(@student_entry)
  end

  test "should destroy student_entry" do
    assert_difference('StudentEntry.count', -1) do
      delete student_entry_url(@student_entry)
    end

    assert_redirected_to student_entries_url
  end
end
