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
        @route.destroy
        flash[:danger] = "successfully delete the route"
        redirect_to routes_path
    end

    private

    def routes_params
        params.require(:route).permit(:source, :destination, :time)
    end

end
