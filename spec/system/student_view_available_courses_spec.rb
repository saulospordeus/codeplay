require 'rails_helper'

describe 'Student view courses on homepage' do
    scenario 'course with enrolment still available' do
        instructor = Instructor.create!(name: 'Fulano Sicrano', email: 'fulano@codeplay.com.br')
        available_course = Course.create!(name: 'Ruby',description: 'Um curso de ruby', 
                                          code: 'RUBYBASIC', price: 10, enrollment_deadline: 1.month.from_now, 
                                          instructor: instructor)
        unavailable_course = Course.create!(name: 'HTML',description: 'Um curso de html', 
                                          code: 'HTMLBASIC', price: 20, enrollment_deadline: 1.day.ago,
                                          instructor: instructor) 
        
        visit root_path

        expect(page).to have_content('Ruby')
        expect(page).to have_content(available_course.description)
        expect(page).to have_content('R$ 10,00')
        expect(page).not_to have_content('HTML')
        expect(page).not_to have_content(unavailable_course.description)
        expect(page).not_to have_content('R$ 12,00')
    end
    
    scenario 'and view enrollment link' do
      user = User.create!(email: 'jane@test.com.br', password: '123456')
      instructor = Instructor.create!(name: 'Fulano Sicrano',
                                      email: 'fulano@codeplay.com.br')
      available_course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                              code: 'RUBYBASIC', price: 10,
                              enrollment_deadline: 1.month.from_now, instructor: instructor)
 
      login_as user, scope: :user
      visit root_path
      click_on 'Ruby'
        
      expect(page).to have_link 'Comprar'
    end
    
    scenario 'must be signed in to enroll' do
      instructor = Instructor.create!(name: 'Fulano Sicrano', email: 'fulano@codeplay.com.br')
      available_course = Course.create!(name: 'Ruby',description: 'Um curso de ruby', 
                                         code: 'RUBYBASIC', price: 10, enrollment_deadline: 1.month.from_now, 
                                         instructor: instructor)
      visit(root_path)
      click_on 'Ruby'
      expect(page).not_to have_link 'Comprar'
      expect(page).to have_content("Faça login para comprar este curso")   
    end

    it 'and buy a course' do
      user = User.create!(email: 'jane@test.com.br', password: '123456')
      instructor = Instructor.create!(name: 'Fulano Sicrano',
                                      email: 'fulano@codeplay.com.br')
      available_course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                              code: 'RUBYBASIC', price: 10,
                              enrollment_deadline: 1.month.from_now, instructor: instructor)
      other_course = Course.create!(name: 'Elixir', description: 'Um curso de programação funcional',
                              code: 'ELIXIRBASIC', price: 20,
                              enrollment_deadline: 1.month.from_now, instructor: instructor)
  
      login_as user, scope: :user
      visit root_path
      click_on 'Ruby'
      click_on 'Comprar'
  
      expect(page).to have_content 'Curso comprado com sucesso'
      expect(current_path).to eq my_courses_courses_path
      expect(page).to have_content 'Ruby'
      expect(page).to have_content 'R$ 10,00'
      expect(page).not_to have_content 'Elixir'
      expect(page).not_to have_content 'R$ 20,00'
    end

    it 'and cannot buy a course twice' do
      user = User.create!(email: 'jane@test.com.br', password: '123456')
      instructor = Instructor.create!(name: 'Fulano Sicrano',
                                      email: 'fulano@codeplay.com.br')
      available_course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                              code: 'RUBYBASIC', price: 10,
                              enrollment_deadline: 1.month.from_now, instructor: instructor)
      Lesson.create!(name: 'Monkey Patch', course: available_course, duration: 20, content:'Uma aula legal')
      Enrollment.create!(user: user, course: available_course)
  
      login_as user, scope: :user
      visit root_path
      click_on 'Ruby'

      expect(page).not_to have_link 'Comprar'
      expect(page).to have_link 'Monkey Patch'
    end

    
      
end