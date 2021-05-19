require 'rails_helper'

describe 'Admin deletes courses' do
    it 'sucessfully' do
        course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
            code: 'RUBYBASIC', price: 10,
            enrollment_deadline: '22/12/2033')
        
        visit course_path(course)
       
        expect { click_on 'Apagar'}.to change {Course.count}.by(-1)
        expect(current_path).to eq(courses_path) 
        expect(page).to have_text('Curso apagado com sucesso')

    end
end