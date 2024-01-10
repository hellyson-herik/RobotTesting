*** Settings ***
Library     SeleniumLibrary


*** Test Cases ***
Abrir navegador, preencher formulario e criar card
    Abrir navegador e acessar o site do organo
    Preencher os campos do formulario
    Verificar se foi acrescentado no card
    sleep  2

*** Keywords ***
Abrir navegador e acessar o site do organo
    open browser    url=http://localhost:3000/      browser=Chrome

Preencher os campos do formulario
    input text      form-nome                       TestNome
    input text      form-cargo                      TestCargo
    input text      form-imagem                     https://picsum.photos/200/300
    click element   class:lista-suspensa
    click element   //option[contains(., 'Programação')]
    click element   form-botao

Verificar se foi acrescentado no card
    element should be visible   class:colaborador
