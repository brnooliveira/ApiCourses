class Api::V1::TestController < ApplicationController

  before_action :set_test, only: %i[ show update destroy]

  def index
    @tests = Test.all

    render json: @tests, :include => [:course]
    
  end

  def show
    render json: @test, :include => [:course]
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      render json: @test, status: :created, location: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  def update
    if @test.update(test_params)
      render json: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @test.destroy
      render json: @test
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  private

    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:name, :date, :course_id)
    end
end
