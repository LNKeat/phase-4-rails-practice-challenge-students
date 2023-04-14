class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        instructors = Instructor.all 
        render json: instructors
    end

    def show 
        instructor = find_instructor
        render json: instructor
    end

    def create 
        instructor = Instructor.create(instructor_params)
        if instructor.valid? 
            render json:instructor, status: :created
        else
            render json: { errors: instructor.errors }, status: :unprocessable_entity    
        end
    end

    def update 
        instructor = find_instructor
        if instructor.valid? 
            instructor.update(instructor_params)
            render json: instructor
        else
            render json: { errors: instructor.errors }, status: :unprocessable_entity    
        end
    end

    def destroy 
        instructor = find_instructor
        instructor.destroy
        render json: { message: "instructor deleted" }
    end

    private

    def find_instructor 
        instructor = Instructor.find(params[:id])
    end

    def instructor_params
        params.permit(:name)
    end

end
