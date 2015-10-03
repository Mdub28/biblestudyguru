require 'test_helper'

class StudyPassagesControllerTest < ActionController::TestCase
  setup do
    @study_passage = study_passages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_passages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_passage" do
    assert_difference('StudyPassage.count') do
      post :create, study_passage: { bible_book: @study_passage.bible_book, bible_passage_annotation_id: @study_passage.bible_passage_annotation_id, bible_translation_id: @study_passage.bible_translation_id, chapter_end: @study_passage.chapter_end, chapter_start: @study_passage.chapter_start, duration_in_minutes: @study_passage.duration_in_minutes, position: @study_passage.position, study_id: @study_passage.study_id, verse_end: @study_passage.verse_end, verse_start: @study_passage.verse_start }
    end

    assert_redirected_to study_passage_path(assigns(:study_passage))
  end

  test "should show study_passage" do
    get :show, id: @study_passage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_passage
    assert_response :success
  end

  test "should update study_passage" do
    patch :update, id: @study_passage, study_passage: { bible_book: @study_passage.bible_book, bible_passage_annotation_id: @study_passage.bible_passage_annotation_id, bible_translation_id: @study_passage.bible_translation_id, chapter_end: @study_passage.chapter_end, chapter_start: @study_passage.chapter_start, duration_in_minutes: @study_passage.duration_in_minutes, position: @study_passage.position, study_id: @study_passage.study_id, verse_end: @study_passage.verse_end, verse_start: @study_passage.verse_start }
    assert_redirected_to study_passage_path(assigns(:study_passage))
  end

  test "should destroy study_passage" do
    assert_difference('StudyPassage.count', -1) do
      delete :destroy, id: @study_passage
    end

    assert_redirected_to study_passages_path
  end
end
