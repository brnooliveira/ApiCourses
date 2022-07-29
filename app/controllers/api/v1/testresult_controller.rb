class Api::V1::TestresultController < ApplicationController
  before_action :set_testresult, only: %i[ show update destroy]


  def index
    @testresults = Testresult.all

    render json: @testresults, :include => [:grader,:student,:test]
  end

  def show
    render json: @testresult
  end

  def create
    @testresult = Testresult.new(testresult_params)

    if @testresult.save
      render json: @testresult, status: :created, location: @testresult
    else
      render json: @testresult.errors, status: :unprocessable_entity
    end
  end

  private 

    def set_testresult
      @testresult = Testresult.find(params[:id]) 
    end

    def testresult_params
      params.require(:testresult).permit(:result, :test_id, :grader_id, :student_id)
    end
end
