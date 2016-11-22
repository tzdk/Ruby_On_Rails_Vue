class EmployeesController < ApplicationController

  def index
    #@employees = Employee.all
    json_str = Employee.all.to_json   
    render :json=>json_str, status=>'200'
  end
  def new
  end
  def show
    @employee = Employee.find(params[:id])
  end
  def create
    @employee = Employee.new(employee_params)
    @employee.save
    json_str = @employee.to_json
    render :json=>json_str, status=>'200'
  end
  
  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      json_str = @employee.to_json   
      render :json=>json_str, status=>'200'
    else
      render 'edit'
    end
  end
  
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    json_str = @employee.to_json   
    render :json=>json_str, status=>'200'
  end
  private
    def employee_params
      params.permit(:name, :gender,:age,:telephone)
    end
end
