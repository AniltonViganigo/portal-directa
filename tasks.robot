*** Settings ***
Documentation       Template robot main suite.

Library    RPA.Browser.Selenium
Library    RPA.FileSystem

*** Variables ***

${URL_PORTAL_DIRECTA}    %{URL}
${USER_PORTAL_DIRECTA}    %{USER}
${PASSWORD_PORTAL_DIRECTA}    %{PASSWORD}

*** Tasks ***
Open Portal Directa
    Open Portal Directa
    Login Portal Directa
    Acessa Notas Natalense Download NFS-e
    Download NFS-e
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

Download NFS-e
    Sleep    5
    Select Frame    //*[@id="iframe0"]
    Select Frame    //frame[@name='mainform']
    Execute Javascript    document.querySelector('#lay > div:nth-child(3) > div.tabArea > div:nth-child(10) > div:nth-child(2) > div > div > table > tbody > tr > td').click()
    Sleep    0.5  
    Click Element When Visible    //*[@id="lookupInput"]/option[6]
    Input Text    //input[@name='WFRInput668292']    01/07/2022
    Input Text    //input[@name='WFRInput668291']    31/07/2022
    Click Element When Visible    //*[@id="HTMLGroupBox668289"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5  
    Click Element When Visible    //*[@id="lay"]/div[2]/div[2]/div[22]/div/table/tbody/tr/td
    Sleep    0.5  
    Click Element When Visible    //*[@id="HTMLGroupBox668289"]/table/tbody/tr[3]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5
    Click Element When Visible    //*[@id="lay"]/div[2]/div[2]/div[23]/div/table/tbody/tr/td  
    Sleep    0.5
    Unselect Frame
    Select Frame    //frame[@name='mainsystem']
    Sleep    0.5
    Select Frame    //frame[@name='mainsystem']
    Execute Javascript    document.getElementsByTagName('a')[158].click()
    Sleep    1

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