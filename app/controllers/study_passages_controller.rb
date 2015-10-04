class StudyPassagesController < ApplicationController
  before_action :set_study_passage, only: [:show, :edit, :update, :destroy]

  # GET /study_passages
  # GET /study_passages.json
  def index
    @study_passages = StudyPassage.all
  end

  # GET /study_passages/1
  # GET /study_passages/1.json
  def show
  end

  # GET /study_passages/new
  def new
    @study_passage = StudyPassage.new
  end

  # GET /study_passages/1/edit
  def edit
  end

  # POST /study_passages
  # POST /study_passages.json
  def create

    parser = VerseParser.new(params[:query])
    parser.validate
    @study_passage = StudyPassage.new(parser.to_study_passage_attributes.merge(study_id: params[:study_id]))

    respond_to do |format|
      if @study_passage.save
        format.html { redirect_to :back}
        format.json { render :show, status: :created, location: @study_passage }
      end
    end
  end

  # PATCH/PUT /study_passages/1
  # PATCH/PUT /study_passages/1.json
  def update
    respond_to do |format|
      if @study_passage.update(study_passage_params)
        format.html { redirect_to @study_passage, notice: 'Study passage was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_passage }
      else
        format.html { render :edit }
        format.json { render json: @study_passage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_passages/1
  # DELETE /study_passages/1.json
  def destroy
    @study_passage.destroy
    respond_to do |format|
      format.html { redirect_to study_passages_url, notice: 'Study passage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_passage
      @study_passage = StudyPassage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_passage_params
      params.require(:study_passage).permit(:study_id, :bible_book, :chapter_start, :verse_start, :chapter_end, :verse_end, :bible_translation_id, :position, :bible_passage_annotation_id, :duration_in_minutes)
    end
end
