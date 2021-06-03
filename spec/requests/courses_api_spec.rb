require 'rails_helper'

describe 'Courses API' do
  context 'GET /api/v1/courses' do
    it 'should get courses' do
      instructor = Instructor.create!(name: 'Fulano Sicrano',
                                      email: 'fulano@codeplay.com.br')
      Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                    code: 'RUBYBASIC', price: 10,
                    enrollment_deadline: '22/12/2033', instructor: instructor)
      Course.create!(name: 'Ruby on Rails',
                    description: 'Um curso de Ruby on Rails',
                    code: 'RUBYONRAILS', price: 20,
                    enrollment_deadline: '20/12/2033', instructor: instructor)

      get '/api/v1/courses'

      parsed_body = JSON.parse(response.body)
      expect(response.content_type).to include('application/json')
      expect(response).to have_http_status(200)
      expect(parsed_body[0]['name']).to eq('Ruby')
      expect(parsed_body[1]['name']).to eq('Ruby on Rails')
    end

    it 'returns no courses' do
      get '/api/v1/courses'

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      parsed_body = JSON.parse(response.body)
      expect(parsed_body).to be_empty
    end
  end

  context 'GET /api/v1/courses/:code' do
    it 'should return a course' do
      instructor = Instructor.create!(name: 'Fulano Sicrano',
                                      email: 'fulano@codeplay.com.br')
      course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                              code: 'RUBYBASIC', price: 10,
                              enrollment_deadline: '22/12/2033', instructor: instructor)
      other_course = Course.create!(name: 'Ruby on Rails',
                                    description: 'Um curso de Ruby on Rails',
                                    code: 'RUBYONRAILS', price: 20,
                                    enrollment_deadline: '20/12/2033', instructor: instructor)
      

    get "/api/v1/courses/#{course.code}" 
    
    expect(response).to have_http_status(200)
    expect(response.content_type).to include('application/json')
    expect(parsed_body['code']).to eq('RUBYBASIC')
    expect(response.body).not_to include('RUBYONRAILS')

    end
  
    it 'should not found course by code' do
      get '/api/v1/courses/ABC1234'
    expect(response).to have_http_status(404)
    end
  end

  context 'POST /api/v1/courses'do
  it 'should create a course' do
    instructor = Instructor.create!(name: 'Fulano Sicrano',
                                    email: 'fulano@codeplay.com.br')

    post '/api/v1/courses', params: { 
      course: { 
        name: 'Ruby on Rails', code: 'RUBYONRAILS', price: 10,
        instructor_id: instructor.id
      },
    }
      expect(response).to have_http_status(201)
      expect(response.content_type).to include('application/json')
      expect(parsed_body['code']).to eq('RUBYONRAILS')
      expect(parsed_body['name']).to eq('Ruby on Rails')
      expect(parsed_body['price']).to eq('10.0')
    end
  end

  #TODO: TESTE DO DANDO ERRADO PRA SAIR NO ELSE DO CONTROLLER

  private 
  
  def parsed_body
    JSON.parse(response.body)
  end

end
  

