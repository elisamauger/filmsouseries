require 'test_helper'

class DocumentairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @documentaire = documentaires(:one)
  end

  test "should get index" do
    get documentaires_url
    assert_response :success
  end

  test "should get new" do
    get new_documentaire_url
    assert_response :success
  end

  test "should create documentaire" do
    assert_difference('Documentaire.count') do
      post documentaires_url, params: { documentaire: { nom: @documentaire.nom, realisateur: @documentaire.realisateur } }
    end

    assert_redirected_to documentaire_url(Documentaire.last)
  end

  test "should show documentaire" do
    get documentaire_url(@documentaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_documentaire_url(@documentaire)
    assert_response :success
  end

  test "should update documentaire" do
    patch documentaire_url(@documentaire), params: { documentaire: { nom: @documentaire.nom, realisateur: @documentaire.realisateur } }
    assert_redirected_to documentaire_url(@documentaire)
  end

  test "should destroy documentaire" do
    assert_difference('Documentaire.count', -1) do
      delete documentaire_url(@documentaire)
    end

    assert_redirected_to documentaires_url
  end
end
