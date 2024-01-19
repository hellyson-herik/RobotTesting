*** Settings ***
Library             SeleniumLibrary
Test Setup          Dado que eu acesse o Organo
Test Teardown       Fechar o navegador


*** Variables ***
${CAMPO_NOME}        form-nome
${CAMPO_CARGO}       form-cargo
${CAMPO_IMAGEM}      form-imagem
${CAMPO_TIME}        class:lista-suspensa
${CAMPO_CARD}        form-botao
${PROGRAMACAO}       //option[contains(., 'Programação')]
${FRONT-END}         //option[contains(., 'Front-End')]
${DADOS}             //option[contains(., 'Dados')]
${DEVOPS}            //option[contains(., 'Devops')]
${UX}                //option[contains(., 'UX e Design')]
${MOBILE}            //option[contains(., 'Mobile')]
${INOVACAO}          //option[contains(., 'Inovação')]

*** Keywords ***
Dado que eu acesse o Organo
    open browser    url=http://localhost:3000/      browser=Chrome

Quando eu preencher os formularios
    input text      ${CAMPO_NOME}        TestNome
    input text      ${CAMPO_CARGO}       TestCargo
    input text      ${CAMPO_IMAGEM}      https://picsum.photos/200/300
    click element   ${CAMPO_TIME}
    click element   ${PROGRAMACAO}


E clique no botão criar card
    click element   ${CAMPO_CARD}

Então o card deve ser adicionado no time esperado
    element should be visible   class:colaborador

Fechar o navegador

*** Test Cases ***
Abrir navegador, preencher formulario e criar card
    Dado que eu acesse o Organo
    Quando eu preencher os formularios
    E clique no botão criar card
    Então o card deve ser adicionado no time esperado