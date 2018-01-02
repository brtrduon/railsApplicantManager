class EmployeesController < ApplicationController
    def home
        @current_user = current_user
        @employees = Employee.all.order(can_start: :asc)
        @recycle = Recycle.all.order(can_start: :asc)
    end

    def add
        @current_user = current_user
    end

    def create
        @employee = Employee.new employee_params
        if @employee.save
            redirect_to '/home'
        else
            flash[:errors] = @employee.errors.full_messages
            redirect_to '/add'
        end
    end

    def show
        @current_user = current_user
        @employee = Employee.find(params[:id])
    end

    def edit
        @current_user = current_user
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to '/home'
        else
            flash[:errors] = @employee.errors.full_messages
            redirect_to :back
        end
    end

    def delete
        @current_user = current_user
        @employee = Employee.find(params[:id])
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy if @employee.user === current_user
        redirect_to '/home'
    end

    def recycle
        @employee = Employee.find(params[:id])
        @recycle = Recycle.new employee_params
        if @recycle.save
            @employee.destroy if @employee.user === current_user
            redirect_to '/home'
        else
            flash[:errors] = @employee.errors.full_messages
            redirect_to :back
        end
    end


    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :job_position, :city, :can_start).merge(user: current_user)
    end
end
