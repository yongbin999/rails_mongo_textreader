require 'test_helper'

class NewFilesControllerTest < ActionController::TestCase
  setup do
    @new_file = new_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:new_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new_file" do
    assert_difference('NewFile.count') do
      post :create, new_file: { content: @new_file.content, fileid: @new_file.fileid, line: @new_file.line }
    end

    assert_redirected_to new_file_path(assigns(:new_file))
  end

  test "should show new_file" do
    get :show, id: @new_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @new_file
    assert_response :success
  end

  test "should update new_file" do
    patch :update, id: @new_file, new_file: { content: @new_file.content, fileid: @new_file.fileid, line: @new_file.line }
    assert_redirected_to new_file_path(assigns(:new_file))
  end

  test "should destroy new_file" do
    assert_difference('NewFile.count', -1) do
      delete :destroy, id: @new_file
    end

    assert_redirected_to new_files_path
  end
end
