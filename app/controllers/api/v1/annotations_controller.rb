module Api
  module V1
    class AnnotationsController < BaseApiController
      # GET /annotations.json
      def index
        render json: format_json_output(Annotation.all)
      end

      # GET /annotations/1.json
      def show
        render json: format_json_output(Annotation.find(params[:id]))
      end

      # # POST /annotations.json
      def create
        @annotation = Annotation.new(annotation_params)

        if @annotation.save
          render json: format_json_output(@annotation)
        else
          render json: format_json_output(@annotation, status: 'validation_errors')
        end
      end

      # PATCH/PUT /annotations/1.json
      def update
        @annotation = Annotation.find(params[:id]).destroy
        if @annotation.update(annotation_params)
          render json: format_json_output(@annotation)
        else
          render json: format_json_output(@annotation, status: 'validation_errors')
        end
      end

      # DELETE /annotations/1.json
      def destroy
        Annotation.find(params[:id]).destroy
        render json: format_json_output(nil)
      end

      private
      # Never trust parameters from the scary internet, only allow the white list through.
      def annotation_params
        params.require(:annotations).permit(:user_id, :annotation_type, :content)
      end
    end
  end
end
