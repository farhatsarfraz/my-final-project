class StopsController < ApplicationController
    def index
        @stops = Stop.all
    end
    def show 
        @stops = Stop.find(params[:id])
    end
    def new
        @stops = Stop.new
    end
    def create
        @stops = Stop.new(stops_params)
        if @stops.save
            flash[:notice] = "Stop was created successfully"
        redirect_to stops_path(@stops)
        else 
            render 'new'
        end
    end
    
    def edit
       
    end 
    def update
        if @stops.update(stops_params)
            flash[:notice] = "stop was updated successfully"
            redirect_to stops_path(@stops)
        else 
            render 'edit'
        end
    end
     def destroy
             @stops.destroy
             flash[:notice] = "stop was deleted successfully"
             redirect_to stops_path

        end
     private


    def stops_params
        params.require(:stop).permit(:name)
    end
    
end
