require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post properties_url, params: { property: { descripcion: @property.descripcion, direccion: @property.direccion, lat: @property.lat, lng: @property.lng, moneda: @property.moneda, precio_centavos: @property.precio_centavos, tipo_direccion: @property.tipo_direccion, titulo: @property.titulo, user: @property.user } }
    end

    assert_redirected_to property_url(Property.last)
  end

  test "should show property" do
    get property_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { descripcion: @property.descripcion, direccion: @property.direccion, lat: @property.lat, lng: @property.lng, moneda: @property.moneda, precio_centavos: @property.precio_centavos, tipo_direccion: @property.tipo_direccion, titulo: @property.titulo, user: @property.user } }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property)
    end

    assert_redirected_to properties_url
  end
end
