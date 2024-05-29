class InnDashboard::GroupReservationsController < ApplicationController 
    before_action :authenticate_inn_owner!

    def new
        @inn = current_inn_owner.inn
        @group_reservation = @inn.group_reservations.build
    end

    def create
        
    end

end