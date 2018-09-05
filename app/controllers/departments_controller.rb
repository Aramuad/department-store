class DepartmentsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]
  
  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @departments = Department.new
    render partial: "form"
  end

  def create
    Department.create(dept_params)

    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @department.update(dept_params)
      redirect_to dept_path(@department)
    else
      render :edit
    end
  end

  def destroy
    @departments.destroy
    redirect_to departments_path
  end

  private
    def set_dept
      @department = Department.find(params[:id])
    end
    
    def dept_params
      params.require(:department).permit(:name, :body)
    end
end
