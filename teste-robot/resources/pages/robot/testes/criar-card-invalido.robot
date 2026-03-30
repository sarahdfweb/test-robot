*** Settings ***
Resource    ../resources/shared/setup_teardown.robot
Resource    ../resources/pages/cadastro.robot

Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Nao deve criar card com formulario vazio
    Quando eu clicar em criar card sem preencher nada
    Então devo visualizar mensagens obrigatorias

Nao deve criar card sem nome
    Quando eu preencher apenas cargo
    Então devo ver erro de nome

Nao deve criar card sem cargo
    Quando eu preencher apenas nome
    Então devo ver erro de cargo

Nao deve criar card sem selecionar time
    Quando eu preencher nome e cargo sem selecionar time
    Então devo ver erro de time

*** Keywords ***
Quando eu clicar em criar card sem preencher nada
    Clicar em criar card

Quando eu preencher apenas cargo
    Preencher cargo    QA
    Clicar em criar card

Quando eu preencher apenas nome
    Preencher nome    Sarah
    Clicar em criar card

Quando eu preencher nome e cargo sem selecionar time
    Preencher nome    Sarah
    Preencher cargo    QA
    Clicar em criar card

Então devo visualizar mensagens obrigatorias
    Validar erro de nome
    Validar erro de cargo
    Validar erro de time

Então devo ver erro de nome
    Validar erro de nome

Então devo ver erro de cargo
    Validar erro de cargo

Então devo ver erro de time
    Validar erro de time

