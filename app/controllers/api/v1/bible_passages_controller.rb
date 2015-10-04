module Api
  module V1
    class BiblePassagesController < BaseApiController
      # GET /studies/1.json
      def show
        render json: format_json_output(VerseParser.new(params[:id]).fetch_bible_data.to_h)
      end
    
      private
      # Never trust parameters from the scary internet, only allow the white list through.
      def study_params
        params.require(:study).permit(:user_id, :name, :description)
      end
    end
  end
end
