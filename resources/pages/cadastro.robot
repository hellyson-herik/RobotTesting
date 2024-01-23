*** Settings ***
Resource        ../main.robot

*** Variables ***
${CAMPO_NOME}        form-nome
${CAMPO_CARGO}       form-cargo
${CAMPO_IMAGEM}      form-imagem
${CAMPO_TIME}        class:lista-suspensa
${CAMPO_CARD}        form-botao
@{selecionar_times}
...       //option[contains(., 'Programação')]
...       //option[contains(., 'Front-End')]
...       //option[contains(., 'Data Science')]
...       //option[contains(., 'Devops')]
...       //option[contains(., 'UX e Design')]
...       //option[contains(., 'Mobile')]
...       //option[contains(., 'Inovação e Gestão')]

*** Keywords ***
Quando eu preencher os formularios
    ${Nome}         FakerLibrary.First Name
    ${Cargo}        FakerLibrary.Job
    ${Imagem}       FakerLibrary.Image Url      width=100   height=100
    input text      ${CAMPO_NOME}        ${Nome}
    input text      ${CAMPO_CARGO}       ${Cargo}
    input text      ${CAMPO_IMAGEM}      ${Imagem}
    click element   ${CAMPO_TIME}
    click element   ${selecionar_times}[0]


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

Quando eu preencher os formularios uma vez para cada time
    FOR     ${indice}   ${time}     IN ENUMERATE    @{selecionar_times}
        Quando eu preencher os formularios
        click element       ${time}
        E clique no botão criar card
    END
    sleep  10

Quando eu clicar no botão criar card sem preencher todos os campos obrigatórios
    click element       form-botao

Então o sistema deve apresentar mensagem de campo obrigatório
    element should be visible       form-nome-erro
    element should be visible       form-cargo-erro
    element should be visible       form-times-erro
