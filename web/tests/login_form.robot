*** Settings ***
Resource                            base.robot

Test Setup                          Nova sessão
Test Teardown                       Encerra sessão

*** Test Cases ***
Login com Susseso
    Go to                           ${url}/login
    Login With                      stark       jarvis!
    
    Should See Logged User          Tony Stark   

Senha Inválida
    [tags]                          login_error
    Go to                           ${url}/login
    Login With                      stark       123abc

  
    Should Contain login Alert      Senha é invalida! 

Usuário não existe
    [tags]                          login_user404
    Go to                           ${url}/login
    Login With                      andre       123456

    
    Should Contain Login Alert       O usuário informado não está cadastrado!

*** Keywords ***
Login With  
    [Arguments]                     &{uname}                        ${pass} 
                                                                     
    Input text                      css:input[name=username]        ${uname}
    Input Text                      css:input[name=password]        ${pass}
    Click Element                   class:btn-login  

Should Contain login alert
    [Arguments]                     ${expect_message}

    ${message}=                     Get WebElement                   id:flash
    Should Contain                  ${message.text}                  ${expect_message}       

Should See Logged User  
    [Arguments]                     ${full_name}

    Page Should Contain             Olá, ${full_name}. Você acassou a área logada!