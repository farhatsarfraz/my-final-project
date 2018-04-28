class RoutesController < ApplicationController

    def index
        @routes = Route.all
    end

    def show
        @route = Route.find(params[:id])
    end

    def new
        @route = Route.new
    end

    def create
        @route = Route.new(routes_params)
        if @route.save
            flash[:notice] = "Route was created successfully"
            redirect_to routes_path(@route)
        else
            render 'new'
        end
    end

    def edit
        @route = Route.new
    end

    def update
        if @route.update(routes_params)
            flash[:notice] = "route was updated successfully"
            redirect_to routes_path(@route)
        else
            render 'edit'
        end
    end

    def destroy
        @route = Route.find(params[:id])
        if @route.destroy
            flash[:notice] = "route was deleted successfully"
            redirect_to routes_path
        else
            flash[:notice] = "route was not deleted "
        end
    end

    private

    def routes_params
        params.require(:route).permit(:source, :destination, :time)
    end

end
