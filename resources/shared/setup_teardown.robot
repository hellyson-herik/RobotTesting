*** Settings ***
Library         SeleniumLibrary

Resource        ../main.robot

*** Keywords ***
Dado que eu acesse o organo
    open browser    url=http://localhost:3000/      browser=Chrome

Fechar o navegador
    close browser