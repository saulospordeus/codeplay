require 'rails_helper'

describe 'admin updates instructors' do
  it 'successfully' do
    instructor = Instructor.create!(name: 'Aloprado', email: 'aloprado@gmail.com',
                                    bio: 'Geneticista e comediante')
    instructor.avatar.attach(io: File.open(Rails.root.join("tmp", 'storage', 'aloprado.jpg')), filename: 'aloprado.jpg') 
    
    visit root_path
    click_on 'Professores'
    click_on 'Aloprado'
    click_on 'Editar'
    
    fill_in 'Nome', with: 'Einstein'
    fill_in 'Email', with: 'albie21@gmail.com'
    fill_in 'Descrição', with: 'Físico'
    attach_file 'Foto', Rails.root.join("tmp", 'storage', 'einstein.jpg')
    click_on "Editar"

    # (TODO) ADICIONAR FOTO NO FILL IN E NO EXPECT
    # expectativas
    expect(page).to have_css('h1', text: 'Einstein')
    expect(page).to have_css('p', text: 'albie21@gmail.com')
    expect(page).to have_css('p', text: 'Físico')
    expect(page).to have_css('img[src*="einstein.jpg"]')

  end
end