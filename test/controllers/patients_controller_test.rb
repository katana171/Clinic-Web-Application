require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest

  test "create should create a new patient" do
    post creating_path, params: { patient: { first_name: 'Rails is awesome!',last_name: 'Rails is awesome!', middle_name: 'Rails is awesome!', mrn: 'Rails is awesome!' } }
  end

  test "should get index" do
    get patients_index_url
    assert_response :success
  end

  test "should get show" do
    get patients_show_url
    assert_response :success
  end

  test "should get edit" do
    get patients_edit_url
    assert_response :success
  end

  test "should get create" do
    get patients_create_url
    assert_response :success
  end

  test "should get destroy" do
    assert_response :success
  end

end
