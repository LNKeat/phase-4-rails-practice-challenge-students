class InstructorsController < ApplicationController
    def index 
        instructors = Instructor.all 
        render json: instructors
    end

    def show 
    end

end
