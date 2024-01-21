*** Settings ***
Library             SeleniumLibrary
Library             FakerLibrary


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
    ${Nome}         FakerLibrary.First Name
    ${Cargo}        FakerLibrary.Job
    ${Imagem}       FakerLibrary.Image Url
    input text      ${CAMPO_NOME}        ${Nome}
    input text      ${CAMPO_CARGO}       ${Cargo}
    input text      ${CAMPO_IMAGEM}      ${Imagem}
    click element   ${CAMPO_TIME}
    click element   ${PROGRAMACAO}


E clique no botão criar card
    click element   ${CAMPO_CARD}

Então o card deve ser adicionado no time esperado
    element should be visible   class:colaborador

Quando eu preencher os formularios 3 vezes repetidamente e clicar no botão criar card
    FOR     ${i}    IN RANGE    0   3
        Quando eu preencher os formularios
        E clique no botão criar card
    END
    sleep  10
*** Test Cases ***
#Abrir navegador, preencher formulario e criar card
#    Dado que eu acesse o Organo
#    Quando eu preencher os formularios
#    E clique no botão criar card
#    Então o card deve ser adicionado no time esperado

Verificar se é possível criar mais de um card se preenchermos os campos corretamente
    Dado que eu acesse o Organo
    Quando eu preencher os formularios 3 vezes repetidamente e clicar no botão criar card

