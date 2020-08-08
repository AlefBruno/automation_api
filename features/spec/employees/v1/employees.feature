#language:pt

@employees_v1
Funcionalidade: Employees
  Como uma aplicação de APIs
  Quero chamar o endpoint da API
  Para validar a funcionalidade do mesmo

  @create_employees_v1 @post_employee
  Cenário: Validar criação de empregado
    Dado ter uma massa configurada para criação do empregado
    Quando chamar o endpoint employees_service_v1.post
    Então validar o retorno da criação do empregado
 
  @delete_employees_v1
  Cenário: Validar exclusão de empregado por ID
    Dado ter uma massa configurada para excluir o empregado
    Quando chamar o endpoint employees_service_v1.delete_id
    Então validar o retorno da exclusão do empregado
