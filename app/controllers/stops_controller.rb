class StopsController < ApplicationController
    def index
        @stops = Stop.all
    end
end