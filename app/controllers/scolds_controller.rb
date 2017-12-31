class ScoldsController < ApplicationController
    def create
        Scold.create scold_params
        redirect_to :back
    end

    def remove
        
    end


    private
    def scold_params
        params.require(:scold).permit(:recycle_id).merge(user: current_user)
    end
end
