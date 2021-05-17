require 'rails_helper'

describe 'user regist teachers' do
  it 'successfully' do

      # simula a ação do usuário
      visit root_path
      click_on 'Cadastrar um Professor'
  
      fill_in 'Nome', with: 'Aloprado'
      fill_in 'Email', with: 'aloprado@gmail.com'
      fill_in 'Descrição', with: 'Geneticista e comediante'
      attach_file 'Foto', Rails.root.join("tmp", 'storage', 'aloprado.jpg')
      click_on 'Enviar'

      # (TODO) ADICIONAR FOTO NO FILL IN E NO EXPECT
      # expectativas
      expect(page).to have_css('h1', text: 'Aloprado')
      expect(page).to have_css('p', text: 'aloprado@gmail.com')
      expect(page).to have_css('p', text: 'Geneticista e comediante')
      expect(page).to have_css('img[src*="aloprado.jpg"]')
    end
  end