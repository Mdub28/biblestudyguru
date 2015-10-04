module Api
  module V1
    class CoursesController < BaseApiController
      # GET /courses.json
      def index
        render json: format_json_output(Course.includes(:studies).all)
      end
    
      # GET /courses/1.json
      def show
        render json: format_json_output(Course.find(params[:id]))
      end
    
      # POST /courses.json
      def create
        @course = Course.new(course_params)
    
        if @course.save
          render json: format_json_output(@course)
        else
          render json: format_json_output(@course, status: 'validation_errors')
        end
      end
    
      # PATCH/PUT /courses/1.json
      def update
        @course = Course.find(params[:id]).destroy
        if @course.update(course_params)
          render json: format_json_output(@course)
        else
          render json: format_json_output(@course, status: 'validation_errors')
        end
      end
    
      # DELETE /courses/1.json
      def destroy
        Course.find(params[:id]).destroy
        render json: format_json_output(nil)
      end
    
      private
      # Never trust parameters from the scary internet, only allow the white list through.
      def course_params
        params.require(:course).permit(:user_id, :name, :description)
      end
    end
  end
end
