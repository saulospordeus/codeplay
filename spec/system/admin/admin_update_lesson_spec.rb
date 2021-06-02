require 'rails_helper'

describe 'Admin updates lessons' do
    it 'sucessfully' do
        user = User.create!(email: 'jane@test.com.br', password: '123456')
        instructor = Instructor.create!(name: 'Fulano Sicrano', email: 'fulano@codeplay.com.br')
        course = Course.create!(name: 'Ruby', description: 'Um curso de ruby', code: 'RUBYBASIC',
                                price: 10, enrollment_deadline: '22/12/2033', instructor: instructor)
        lesson = Lesson.create!(name: 'Classes e objetos', duration: 10, content: 'uma aula de ruby', course: course)
        Enrollment.create!(user: user, course: course)      
    
    login_as user, scope: :user                      
    visit admin_course_path(course)
    click_on lesson.name
    click_on 'Editar'
    
    fill_in 'Nome', with: 'Métodos'
    fill_in 'Duração', with: 20
    fill_in 'Conteúdo', with: 'Estudo sobre os métodos ruby'
    click_on "Editar"
  
    expect(page).to have_text('Métodos')
    expect(page).to have_text('Estudo sobre os métodos ruby')
    expect(page).to have_text(20)
    end
end