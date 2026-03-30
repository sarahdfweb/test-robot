*** Settings ***
Resource    ../main.robot

*** Variables ***
${CAMPO_NOME}        id=form-nome
${CAMPO_CARGO}       id=form-cargo
${CAMPO_IMAGEM}      id=form-imagem
${CAMPO_TIME}        class:lista-suspensa
${BOTAO_CRIAR}       id=form-botao

${PROGRAMACAO}       //option[contains(.,'Programação')]
${FRONT_END}         //option[contains(.,'Front-End')]
${DATA_SCIENCE}      //option[contains(.,'Data Science')]
${DEVOPS}            //option[contains(.,'Devops')]

${ERRO_NOME}         id=form-nome-erro
${ERRO_CARGO}        id=form-cargo-erro
${ERRO_TIME}         id=form-times-erro

*** Keywords ***
Preencher nome
    [Arguments]    ${nome}
    Input Text    ${CAMPO_NOME}    ${nome}
    Textfield Value Should Be    ${CAMPO_NOME}    ${nome}

Preencher cargo
    [Arguments]    ${cargo}
    Input Text    ${CAMPO_CARGO}    ${cargo}
    Textfield Value Should Be    ${CAMPO_CARGO}    ${cargo}

Preencher imagem
    [Arguments]    ${imagem}
    Input Text    ${CAMPO_IMAGEM}    ${imagem}
    Textfield Value Should Be    ${CAMPO_IMAGEM}    ${imagem}

Selecionar time
    [Arguments]    ${time}
    Click Element    ${CAMPO_TIME}
    Click Element    ${time}

Clicar em criar card
    Scroll Element Into View    ${BOTAO_CRIAR}
    Click Button    ${BOTAO_CRIAR}

Criar colaborador completo
    [Arguments]    ${nome}    ${cargo}    ${imagem}    ${time}
    Preencher nome    ${nome}
    Preencher cargo    ${cargo}
    Preencher imagem    ${imagem}
    Selecionar time    ${time}
    Clicar em criar card

Validar card criado
    [Arguments]    ${nome}    ${cargo}
    Wait Until Page Contains    ${nome}    2s
    Page Should Contain    ${nome}
    Page Should Contain    ${cargo}

Validar erro de nome
    Element Should Be Visible    ${ERRO_NOME}

Validar erro de cargo
    Element Should Be Visible    ${ERRO_CARGO}

Validar erro de time
    Element Should Be Visible    ${ERRO_TIME}