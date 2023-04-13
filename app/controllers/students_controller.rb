class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index 
        students = Student.all 
        render json: students
    end

    def show 
        student = find_student
        render json: student
    end

    def create 
        student = Student.create(student_params)
        if student.valid? 
            render json:student, status: :created
        else
            render json: { errors: student.errors }, status: :unprocessable_entity    
        end
    end

    def update 
        student = find_student
        if student.valid? 
            student.update(student_params)
            render json: student
        else
            render json: { errors: student.errors }, status: :unprocessable_entity    
        end
    end

    def destroy 
        student = find_student
        student.destroy
        render json: { message: "Student deleted" }
    end

    private

    def find_student 
        student = Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

end
