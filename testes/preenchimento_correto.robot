*** Settings ***
Resource            ../resources/main.robot
Test Setup          Dado Que Eu Acesse O Organo
Test Teardown       Fechar O Navegador

*** Test Cases ***
Abrir navegador, preencher formulario e criar card
    Quando eu preencher os formularios
    E clique no botão criar card
    Então o card deve ser adicionado no time esperado

Verificar se é possível criar mais de um card se preenchermos os campos corretamente
    Quando eu preencher os formularios 3 vezes repetidamente e clicar no botão criar card

Verificar se é possível criar um card para cada time
    Quando eu preencher os formularios uma vez para cada time

