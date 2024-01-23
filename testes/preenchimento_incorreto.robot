*** Settings ***
Library         SeleniumLibrary
Resource        setup_teardown.robot
Test Teardown   Fechar o navegador

*** Variables ***


*** Test Cases ***
Verificar se quando um campo obrigatório não for preenchido corretamente o sistema mostra um erro
    Dado que eu acesse o Organo
    Quando eu clicar no botão criar card sem preencher todos os campos obrigatórios
    Então o sistema deve apresentar mensagem de campo obrigatório
