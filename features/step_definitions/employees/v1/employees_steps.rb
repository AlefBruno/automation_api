Dado('ter uma massa configurada para criação do empregado') do
  @employees = {}
  @employees['name'] = Faker::Name.first_name
  @employees['salary'] = Faker::Number.number(digits: 8)
  @employees['age'] = Faker::Number.number(digits: 2)
end

Quando('chamar o endpoint employees_service_v1.post') do
  @response = employees_service_v1.create_employee(@employees)
end

Então('validar o retorno da criação do empregado') do
  expect(@response.body.nil?).to eql false
  expect(@response.code).to eql messages_load(%w[dummy code success])
  expect(@response['data']).to include 'id'
  expect(@response['status']).to eql messages_load(%w[dummy message success])
  expect(@response['data']['name']).to eql @employees['name']
  expect(@response['data']['salary']).to eql @employees['salary']
  expect(@response['data']['age']).to eql @employees['age']
  expect(@response['message']).to eql messages_load(%w[dummy description success_create_employees])
end

Dado('ter uma massa configurada para excluir o empregado') do
  step 'ter uma massa configurada para criação do empregado'
  step 'chamar o endpoint employees_service_v1.post'
  step 'validar o retorno da criação do empregado'
  @id = @response['data']['id']
end

Quando('chamar o endpoint employees_service_v1.delete_id') do
  @response = employees_service_v1.delete_employee_id(@id)
end

Então('validar o retorno da exclusão do empregado') do
  expect(@response.body.nil?).to eql false
  expect(@response.code).to eql messages_load(%w[dummy code success])
  expect(@response['status']).to eql messages_load(%w[dummy message success])
  expect(@response['data']).to eql @id.to_s
  expect(@response['message']).to eql messages_load(%w[dummy description success_delete_employees])
end
