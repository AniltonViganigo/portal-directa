*** Settings ***
Documentation       Template robot main suite.

Library    RPA.Browser.Selenium

*** Variables ***

${URL_PORTAL_DIRECTA}    %{URL}
${USER_PORTAL_DIRECTA}    %{USER}
${PASSWORD_PORTAL_DIRECTA}    %{PASSWORD}

*** Tasks ***
Open Portal Directa
    Open Portal Directa
    Login Portal Directa
    #Acessa Notas Natalense Download NFS-e
    #Seleciona Empresa
    Acessa Notas Natalense Consultas NFS-e

*** Keywords ***
Open Portal Directa
    Open Available Browser    ${URL_PORTAL_DIRECTA}    maximized=True    alias=FirstBrowser

Login Portal Directa
    Select Frame    //frame[@name='mainsystem']
    Sleep    1
    Input Text When Element Is Visible    //input[@id='usuario']    ${USER_PORTAL_DIRECTA}
    Input Text    //input[@id='senha']    ${PASSWORD_PORTAL_DIRECTA}
    Click Button When Visible    //button[@id='acessar']

Acessa Notas Natalense Download NFS-e
    Select Frame    //frame[@name='mainsystem']
    Sleep    0.5
    Click Element When Visible    //li[@id='limenu9']
    Sleep    0.5
    Click Element When Visible    //a[@value='formsmenu14']
    Sleep    0.5
    Click Element When Visible    //li[@onclick="itemSelecionado(this,578,489,'Nota Natalense - Operações - Download de NFS-e',112)"] 
    #Unselect Frame

Seleciona Empresa
    Sleep    5
    Select Frame    //*[@id="iframe2"]
    Click Element When Visible    css:#lay > div:nth-child(3) > div.tabArea > div:nth-child(10) > div:nth-child(2) > div > div > table > tbody > tr > td
    #Click Button    //div[@id='lay']/div[2]/div[2]/div[10]/div[2]/div/div/table/tbody/tr/td
    Sleep    15

Acessa Notas Natalense Consultas NFS-e
    Select Frame    //frame[@name='mainsystem']
    Sleep    0.5
    Click Element When Visible    //li[@id='limenu9']
    Sleep    0.5       
    ${Element_ConsultaNFS}=    Is Element Visible    //a[@value='formsmenu12']

    IF    ${Element_ConsultaNFS} 
        Click Element When Visible    //a[@value='formsmenu12']    
        Click Element When Visible    //li[@onclick="itemSelecionado(this,800,541,'Nota Natalense - Consultas - Consulta NFS-e',50)"] 
    ELSE
        Click Element When Visible    //li[@id='limenu9']
        Sleep    0.5        
        Click Element When Visible    //a[@value='formsmenu12'] 
        Click Element When Visible    //li[@onclick="itemSelecionado(this,800,541,'Nota Natalense - Consultas - Consulta NFS-e',50)"] 
    END