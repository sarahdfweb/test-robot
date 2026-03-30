*** Settings ***
Resource    ../resources/shared/setup_teardown.robot
Resource    ../resources/pages/cadastro.robot

Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Criar varios cards com BDD e scroll visual
    Quando eu criar colaborador    Sarah Silva    QA                    https://picsum.photos/200/300    ${PROGRAMACAO}
    E eu criar colaborador         Ana Souza      Front-End Developer   https://picsum.photos/200/301    ${FRONT_END}
    E eu criar colaborador         Bruno Lima     Cientista de Dados    https://picsum.photos/200/302    ${DATA_SCIENCE}
    E eu criar colaborador         Carla Rocha    DevOps Engineer       https://picsum.photos/200/303    ${DEVOPS}
    Então devo visualizar todos os cards criados com scroll

*** Keywords ***
Quando eu criar colaborador
    [Arguments]    ${nome}    ${cargo}    ${imagem}    ${time}
    Criar colaborador completo    ${nome}    ${cargo}    ${imagem}    ${time}
    Validar card criado    ${nome}    ${cargo}
    Sleep    1s

E eu criar colaborador
    [Arguments]    ${nome}    ${cargo}    ${imagem}    ${time}
    Criar colaborador completo    ${nome}    ${cargo}    ${imagem}    ${time}
    Validar card criado    ${nome}    ${cargo}
    Sleep    1s

Então devo visualizar todos os cards criados com scroll
    Wait Until Page Contains    Sarah Silva    2s
    Wait Until Page Contains    Ana Souza      2s
    Wait Until Page Contains    Bruno Lima     2s
    Wait Until Page Contains    Carla Rocha    2s

    Scroll Element Into View    xpath=//h4[contains(.,'Sarah Silva')]
    Sleep    1s
    Scroll Element Into View    xpath=//h4[contains(.,'Ana Souza')]
    Sleep    1s
    Scroll Element Into View    xpath=//h4[contains(.,'Bruno Lima')]
    Sleep    1s
    Scroll Element Into View    xpath=//h4[contains(.,'Carla Rocha')]
    Sleep    1s