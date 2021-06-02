require 'rails_helper'

describe 'Admin deletes courses' do
    it 'sucessfully' do
        user = User.create!(email: 'jane@test.com.br', password: '123456')
        instructor = Instructor.create!(name: 'Fulano Sicrano', 
            email: 'fulano@codeplay.com.br')
        course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                                code: 'RUBYBASIC', price: 10,
                                enrollment_deadline: '22/12/2033', instructor: instructor)
        lesson = Lesson.create!(name: 'Classes e objetos', duration: 10, 
                                content: 'Uma aula de ruby', course: course)
        Enrollment.create!(user: user, course: course)
        login_as user, scope: :user

        visit admin_course_lesson_path(course, lesson)

        expect(page).to have_content(lesson.name)
        expect { click_on 'Apagar'}.to change {Lesson.count}.by(-1)
        expect(current_path).to eq(admin_course_path(course)) 

    end
end
