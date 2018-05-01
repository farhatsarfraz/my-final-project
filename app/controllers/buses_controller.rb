class BusesController < ApplicationController
    def index 
       @buses = Bus.all 
    end
    def show 
        @bus = Bus.find(params[:id])
    end
    def new 
        @bus = Bus.new
    end
    def create
        @bus = Bus.new(buses_params)
        if @bus.save
            flash[:notice] = "Bus was created successfully"
            redirect_to buses_path(@bus)
        else 
            render 'new'
        end
    end
    def edit
      @bus = Bus.new
    end 
    def update
        if @bus.update(buses_params)
            flash[:notice] = "bus was updated successfully"
            redirect_to buses_path(@bus)
        else 
            render 'edit'
        end
    end
    def destroy
        @bus.destroy
        flash[:danger] = "bus was successfully deleted"
        redirect_to routes_path
    end
     private


    def buses_params
        params.require(:bus).permit(:regestration_no, :no_of_seates)
    end
    
end

