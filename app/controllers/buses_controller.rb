class BusesController < ApplicationController
    def index 
       @buses = Bus.all 
    end

end
