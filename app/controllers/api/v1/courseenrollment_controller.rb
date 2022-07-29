class Api::V1::CourseenrollmentController < ApplicationController
  def index
    @courseenrollments =  Courseenrollment.all

    render json: @courseenrollments, :include => [:user,:course]

  end

  def create
    @courseenrollment = Courseenrollment.new(courseenrollment_params)

    if @courseenrollment.save
      render json: @courseenrollment, status: :created, location: @courseenrollment
    else
      render json: @courseenrollment.errors, status: :unprocessable_entity
    end
  end

  private

    def courseenrollment_params
      params.require(:courseenrollment).permit(:role, :user_id, :course_id)
    end

end
