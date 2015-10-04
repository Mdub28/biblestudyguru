module Api
  module V1
    class StudiesController < BaseApiController
      # GET /studies.json
      def index
        render json: format_json_output(Study.all)
      end

      # GET /studies/1.json
      def show
        @study = Study.find(params[:id])
        render 'show.json.jbuilder'
      end

      # POST /studies.json
      def create
        @study = Study.new(study_params)

        if @study.save
          render json: format_json_output(@study)
        else
          render json: format_json_output(@study, status: 'validation_errors')
        end
      end

      # PATCH/PUT /studies/1.json
      def update
        @study = Study.find(params[:id]).destroy
        if @study.update(study_params)
          render json: format_json_output(@study)
        else
          render json: format_json_output(@study, status: 'validation_errors')
        end
      end

      # DELETE /studies/1.json
      def destroy
        Study.find(params[:id]).destroy
        render json: format_json_output(nil)
      end

      private
      # Never trust parameters from the scary internet, only allow the white list through.
      def study_params
        params.require(:study).permit(:user_id, :name, :description)
      end
    end
  end
end
