class RecycleController < ApplicationController
    def recycle
        @current_user = current_user
        @recycle = Recycle.all.order(can_start: :asc)
    end

    def show
        @current_user = current_user
        @recycle = Recycle.find(params[:id])
    end

    def delete
        @current_user = current_user
        @recycle = Recycle.find(params[:id])
    end

    def destroy
        @recycle = Recycle.find(params[:id])
        @recycle.destroy if @recycle.user === current_user
        redirect_to '/home/recycle'
    end

    def restore
        @recycle = Recycle.find(params[:id])
        @employee = Employee.new recycle_params
        if @employee.save
            @recycle.destroy if @recycle.user === current_user
            redirect_to '/home/recycle'
        else
            flash[:errors] = @recycle.errors.full_messages
            redirect_to :back
        end
    end


    private
    def recycle_params
        params.require(:recycle).permit(:first_name, :last_name, :email, :job_position, :city, :can_start).merge(user: current_user)
    end
end
