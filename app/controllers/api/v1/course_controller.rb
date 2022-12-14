class Api::V1::CourseController < ApplicationController

  before_action :set_course, only: %i[ show update destroy]


  def index
    @courses =  Course.all

    render json: @courses
  end

  def show
    render json: @course
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    if @course.update(user_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @course.destroy
      render json: :@course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end
  
    def course_params
      params.require(:course).permit(:name, :courseDetails)
    end

  
end
