require 'rails_helper'

describe 'Inn Owner register group reservation' do

    it 'from Inn management page' do
        inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                  document: '53783222001', email: 'joao@email.com', password: '123456')
        inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                        address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
        inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)
        inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)
        
        login_as inn_owner, scope: :inn_owner
        visit root_path
        click_on 'Gestão de Pousadas'

        #Assert
        expect(page).to have_content 'Fazer Reserva para Grupo'

    end

    it 'successfully' do
        inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                  document: '53783222001', email: 'joao@email.com', password: '123456')
        inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                        address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
        inn.inn_rooms.create!(name: 'Quarto com Varanda', size: 35, guest_limit: 3)
        inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3)

        login_as inn_owner, scope: :inn_owner
        visit root_path
        click_on 'Gestão de Pousadas'
        click_on 'Fazer Reserva para Grupo'
        fill_in 'Nome', with: 'Grupo da terceira idade de casa de repouso'
        fill_in 'Data de Check In', with: '28/12/2030'
        fill_in 'Data de Check Out', with: '10/01/2031'
        fill_in 'Número de Hóspedes', with: 12

        click_on 'Criar Reserva'

        expect(page).to have_content 'Reserva Criada com sucesso!'        

    end

end