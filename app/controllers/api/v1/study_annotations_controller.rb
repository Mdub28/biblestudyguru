module Api
  module V1
    class StudyAnnotationsController < BaseApiController
      # # POST /study_annotations.json
      def create
        @study_annotations = StudyAnnotations.new(study_annotation_params)

        if @study_annotations.save
          render json: format_json_output(@study_annotation)
        else
          render json: format_json_output(@study_annotations, status: 'validation_errors')
        end
      end

      # PATCH/PUT /study_annotations/1.json
      def update
        @study_annotations = StudyAnnotations.find(params[:id]).destroy
        if @study_annotations.update(study_annotation_params)
          render json: format_json_output(@study_annotations)
        else
          render json: format_json_output(@study_annotations, status: 'validation_errors')
        end
      end

      # DELETE /study_annotations/1.json
      def destroy
        StudyAnnotations.find(params[:id]).destroy
        render json: format_json_output(nil)
      end

      private
      # Never trust parameters from the scary internet, only allow the white list through.
      def study_annotation_params
        params.require(:study_annotations).permit(:annotations, :position)
      end
    end
  end
end
