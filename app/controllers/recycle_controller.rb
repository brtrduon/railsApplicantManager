class RecycleController < ApplicationController
    def recycle
        @current_user = current_user
        @recycle = Recycle.all
    end
end
