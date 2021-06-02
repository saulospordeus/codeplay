require 'rails_helper'

describe 'Admin view instructors' do
  it 'successfully' do
    Instructor.create!(name: 'Albert Einstein', email: 'albie_einstein@bol.com.br',
                   bio: 'Especialista em Relatividade')

    visit root_path
    click_on 'Professores'

    expect(page).to have_content('Albert Einstein')
    expect(page).to have_content('albie_einstein@bol.com.br')
    expect(page).to have_content('Especialista em Relatividade')
 
  end

end