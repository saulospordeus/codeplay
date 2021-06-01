require 'rails_helper'

describe 'Admin view lessons' do 
  it 'successfully'do
  user = User.create!(email: 'jane@test.com.br', password: '123456')
    instructor = Instructor.create!(name: 'Fulano Sicrano', 
                                      email: 'fulano@codeplay.com.br')
      course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                       code: 'RUBYBASIC', price: 10,
                       enrollment_deadline: '22/12/2033', instructor: instructor)
      other_course = Course.create!(name: 'Rails', description: 'Um curso de Ruby',
                               code: 'RAILSBASIC', price: 40,
                               enrollment_deadline: '22/12/2033', instructor: instructor)
      Lesson.create!(name: 'Classes e objetos', duration: 10, content: 'Uma aula de ruby', course: course)
      Lesson.create!(name: 'Monkey Patch', duration: 20, content: 'Uma aula sobre monkey patch', course: course)
      Lesson.create!(name: 'Uma aula pra não ver', duration: 40, content: 'Aula pra não ver', course: other_course)
      Enrollment.create!(user: user, course: course)
      login_as user, scope: :user
    
      visit course_path(course)

       expect(page).to have_link("Classes e objetos")
       expect(page).to have_text('10 minutos')
       expect(page).to have_link("Monkey Patch")
       expect(page).to have_text('20 minutos')
       expect(page).to_not have_text('Uma aula pra não ver')
       expect(page).to_not have_text('40 minutos')

  end

  it 'view details' do 
    user = User.create!(email: 'jane@test.com.br', password: '123456')
      instructor = Instructor.create!(name: 'Fulano Sicrano', 
                                      email: 'fulano@codeplay.com.br')
      course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                              code: 'RUBYBASIC', price: 10,
                              enrollment_deadline: '22/12/2033', instructor: instructor)
      lesson = Lesson.create!(name: 'Classes e objetos', duration: 10, content: 'Uma aula de ruby', course: course)
      Enrollment.create!(user: user, course: course)
      login_as user, scope: :user
  
      visit course_path(course)
  click_on "#{lesson.name}"

  expect(page).to have_content('Classes e objetos')
  expect(page).to have_content(10)
  expect(page).to have_content('Uma aula de ruby')

  click_on 'Voltar'

  end

end