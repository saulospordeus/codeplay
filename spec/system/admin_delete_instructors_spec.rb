require 'rails_helper'

describe 'Admin deletes instructors' do
    it 'sucessfully' do
        instructor = Instructor.create!(name: 'Aloprado', email: 'aloprado@gmail.com',
            bio: 'Geneticista e comediante')
        instructor.avatar.attach(io: File.open(Rails.root.join("tmp", 'storage', 'aloprado.jpg')), filename: 'aloprado.jpg') 
        
        visit instructor_path(instructor)
       
        expect { click_on 'Apagar'}.to change {Instructor.count}.by(-1)
        expect(current_path).to eq(instructors_path) 

    end
end