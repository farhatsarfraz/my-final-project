class BusesController < ApplicationController
    def index 
       @buses = Bus.all 
    end
    def show 
        @buses = Bus.find(params[:id])
    end
    def new 
        @buses = Bus.new
    end
    def create
        @buses = Bus.new(buses_params)
        if @buses.save
            flash[:notice] = "Bus was created successfully"
        redirect_to buses_path(@buses)
        else 
            render 'new'
        end
    end
    def edit
      @buses = Bus.new
    end 
    def update
        if @buses.update(buses_params)
            flash[:notice] = "bus was updated successfully"
            redirect_to buses_path(@buses)
        else 
            render 'edit'
        end
    end
        def destroy
             @buses.destroy
             flash[:notice] = "bus was deleted successfully"
             redirect_to buses_path

        end
     private


    def buses_params
        params.require(:bus).permit(:bus_no, :no_of_seates)
    end
    
end

