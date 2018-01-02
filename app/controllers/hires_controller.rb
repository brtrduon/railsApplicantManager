class HiresController < ApplicationController
    def create
        @hire = Hire.new hire_params
        @employee = Employee.find(params[:id])
        if @hire.save
            @employee.destroy if @employee.user === current_user
            redirect_to '/home'
        else
            flash[:errors] = @hire.errors.full_messages
            redirect_to :back
        end
    end

    def show
        @current_user = current_user
        @hire = Hire.find(params[:id])
    end

    def edit
        @current_user = current_user
        @hire = Hire.find(params[:id])
    end

    def update
        @hire = Hire.find(params[:id])
        @hire.update(hire_params)
        if @hire.valid?
            @hire.save
            redirect_to '/home'
        else
            flash[:errors] = @hire.errors.full_messages
            redirect_to :back
        end
    end

    def fire
        @current_user = current_user
        @hire = Hire.find(params[:id])
    end

    def destroy
        @hire = Hire.find(params[:id])
        @hire.destroy if @hire.user === current_user
        redirect_to '/home'
    end


    private
    def hire_params
        params.require(:hire).permit(:first_name, :last_name, :email, :job_position, :city).merge(user: current_user)
    end
end
