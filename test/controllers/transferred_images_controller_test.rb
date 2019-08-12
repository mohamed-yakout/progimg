require 'test_helper'

class TransferredImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transferred_image = transferred_images(:one)
  end

  test "should get index" do
    get transferred_images_url, as: :json
    assert_response :success
  end

  test "should create transferred_image" do
    assert_difference('TransferredImage.count') do
      post transferred_images_url, params: { transferred_image: { colorspace: @transferred_image.colorspace, format: @transferred_image.format, image_id: @transferred_image.image_id, img: @transferred_image.img, resize: @transferred_image.resize, rotate: @transferred_image.rotate } }, as: :json
    end

    assert_response 201
  end

  test "should show transferred_image" do
    get transferred_image_url(@transferred_image), as: :json
    assert_response :success
  end

  test "should update transferred_image" do
    patch transferred_image_url(@transferred_image), params: { transferred_image: { colorspace: @transferred_image.colorspace, format: @transferred_image.format, image_id: @transferred_image.image_id, img: @transferred_image.img, resize: @transferred_image.resize, rotate: @transferred_image.rotate } }, as: :json
    assert_response 200
  end

  test "should destroy transferred_image" do
    assert_difference('TransferredImage.count', -1) do
      delete transferred_image_url(@transferred_image), as: :json
    end

    assert_response 204
  end
end
