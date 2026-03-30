*** Settings ***
Resource    ../main.robot

*** Variables ***
${URL}    http://localhost:3000/

*** Keywords ***
Dado que eu acesse o Organo
    Open Browser    ${URL}    chrome
    Set Window Size    780    1020
    Set Selenium Speed    0.1s

Fechar o navegador
    Close Browser