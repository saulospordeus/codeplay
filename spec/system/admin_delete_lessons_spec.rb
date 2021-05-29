require 'rails_helper'

describe 'Admin deletes courses' do
    it 'sucessfully' do
        instructor = Instructor.create!(name: 'Fulano Sicrano', 
            email: 'fulano@codeplay.com.br')
        course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                                code: 'RUBYBASIC', price: 10,
                                enrollment_deadline: '22/12/2033', instructor: instructor)
        lesson = Lesson.create!(name: 'Classes e objetos', duration: 10, 
                                content: 'Uma aula de ruby', course: course)
       
        visit course_lesson_path(course, lesson)
        
        expect { click_on 'Apagar'}.to change {Lesson.count}.by(-1)
        expect(current_path).to eq(course_path(course)) 

    end
end
