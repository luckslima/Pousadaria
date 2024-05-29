class InnDashboard::GroupReservationsController < ApplicationController 
    before_action :authenticate_inn_owner!

    def new
        @inn = current_inn_owner.inn
        @group_reservation = @inn.group_reservations.build
    end

    def create
        @inn = current_inn_owner.inn
        reservation_params = params.require(:group_reservation).permit(:name, :start_date, :end_date, :number_of_guests)
        @group_reservation = @inn.group_reservations.build(reservation_params)
        
        if @group_reservation.save 
            redirect_to inn_management_path, notice: 'Reserva Criada com sucesso!'
        else 
            render :new, status: :unprocessable_entity
        end
    end

end