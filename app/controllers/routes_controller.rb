class RoutesController < ApplicationController

    def index
        @routes = Route.all
    end

    def show
        @route = Route.find(params[:id])
        set_stops(@route)
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
            flash[:danger] = "Failed to create a route"
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

    def add_stops
        @route = Route.find(params[:id])
        stops = params[:route][:stop_ids].reject!(&:blank?)
        existing_stops = @route.stops.pluck(:id).uniq
        new_stops = stops - existing_stops
        if new_stops.present?
            @stops = Stop.where(id: new_stops)

            @route.stops << @stops
            flash[:notice] = "successfully added the stops"
        else
            flash[:danger] = "Stops not added"
        end
        set_stops(@route)
        render 'show'
    end

    private

    def routes_params
        params.require(:route).permit(:name, :start_stop_id, :end_stop_id, :time, :distance, :stop_ids)
    end


    def set_stops route
        @stops_list = Stop.all.map do |stop|
            [stop.name, stop.id] unless [route.start_stop_id, route.end_stop_id].include? (stop.id)
         end
        existing_stops = route.stops.map { |stop| [stop.name, stop.id]}
        @stops_list = @stops_list.reject!(&:blank?) - existing_stops
        @stops_list
    end

end
