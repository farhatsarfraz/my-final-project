class StopsController < ApplicationController
    def index
        @stops = Stop.all
    end
    def show
        @stop = Stop.find(params[:id])
    end
    def new
        @stop = Stop.new
    end
    def create
        @stop = Stop.new(stops_params)
        if @stop.save
            flash[:notice] = "Stop was created successfully"
            redirect_to stops_path(@stops)
        else
            flash[:error] = @stop.errors.full_messages.to_sentence
            render 'new'
        end
    end

    def edit

    end
    def update
        if @stop.update(stops_params)
            flash[:notice] = "stop was updated successfully"
            redirect_to stops_path(@stops)
        else
            flash[:error] = @stop.errors.full_messages.to_sentence
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
        params.require(:stop).permit(:name, :latitude, :longitude)
    end

end
