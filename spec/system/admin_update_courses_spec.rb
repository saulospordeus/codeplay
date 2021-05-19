require 'rails_helper'

describe 'admin updates courses' do
  it 'successfully' do
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                                 code: 'RUBYBASIC', price: 10,
                                 enrollment_deadline: '22/12/2033')
    
    visit course_path(course)
    click_on 'Editar'
    fill_in 'Nome', with: 'Ruby on Rails'
    fill_in 'Descrição', with: 'Curso de ruby on rails'
    fill_in 'Código', with: 'RUBY ON RAILS'
    fill_in 'Preço', with: 30
    fill_in 'Data limite de matrícula', with: Date.current.strftime('%d/%m/%Y')
    click_on 'Salvar'

    expect(page).to have_text('Ruby on Rails')
    expect(page).to have_text('Curso de ruby on rails')
    expect(page).to have_text('RUBY ON RAILS')
    expect(page).to have_text('R$ 30,00')
    expect(page).to have_text(Date.current.strftime('%d/%m/%Y'))

  end
end