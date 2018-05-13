class BusesController < ApplicationController
    before_action :set_bus, only: [:show, :edit, :update, :destroy]
    def index 
       @buses = Bus.all 
       @comment = Comment.new
       @comments = Comment.all

    end
    
    def show 
     
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

    def set_bus
        @bus = Bus.find(params[:id]) 
    end
    def buses_params
        params.require(:bus).permit(:regestration_no, :no_of_seates)
    end 
    
    
end

