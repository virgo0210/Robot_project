*** Settings ***
Library    SeleniumLibrary

Suite Setup      Log     i am inside suite setup
Suite Teardown    Log    i am inside suite teardown
Test Setup    Log     i am inside test setup
Test Teardown    Log     i am inside test teardown

Default Tags    Sanity
*** Test Cases ***
MyFirstTest
   [Tags]       Smoke 
    Log  Welcome
    
MySecondTest
  [Tags]    Example
    Log    i am inside 2nd test
    Set Tags    Regression1
    Remove Tags    Regression1
    
MyThridTest
    Log    i am inside 3rd test
    
FirstSeleniumTestcase
    Open Browser    https://google.com   chrome
    Set Browser Implicit Wait    5        
    Input Text        name=q      Pooja
    Sleep    2    
    Press Keys   name=q     ENTER
   Close Browser
    Log    Test completed
    
SampleLoginTest
    [Documentation]        This is a sample test
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    Set Browser Implicit Wait    5
    Input Text    name=username    Admin
    Input Password    name=password    admin123
    Click Button    class=orangehrm-login-button    
    Click Element    class=oxd-userdropdown-tab    
    Click Element    link=Logout
    Close Browser
    Log    Test success
        
SampleLoginTestforvariable
    [Documentation]        This is a sample test
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element    class=oxd-userdropdown-tab    
    Click Element    link=Logout
    Close Browser
    Log    Test completed by %{username} in %{OS}
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USER}    Admin    admin123    
${CREDENTIALS}    username=Admin    password=admin123
#${USER}     Admin
*** Keywords ***
LoginKW
    
    Input Text    name=username    ${USER}[0]
    Input Password    name=password     ${CREDENTIALS}[password]
    Click Button    class=orangehrm-login-button    


