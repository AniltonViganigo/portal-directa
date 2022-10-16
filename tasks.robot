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
    Click Element When Visible    //a[@value='formsmenu12']
    Sleep    0.5
    Click Element When Visible    //li[@onclick="itemSelecionado(this,800,541,'Nota Natalense - Consultas - Consulta NFS-e',50)"] 
    Unselect Frame    
Seleciona Empresa
    #Select Frame    //frame[@name='mainform']
    #Click Element When Visible    //*[@id='close_form1']
    Sleep    15
    #Click Button    //div[@id='lay']/div[2]/div[2]/div[10]/div[2]/div/div/table/tbody/tr/td

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