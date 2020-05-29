*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         10.33.70.62:8181
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     root
${VALID PASSWORD}   glgjssy&qyhfbqz
${LOGIN URL}      http://${SERVER}/#/login
${WELCOME URL}    http://${SERVER}/#/
${ERROR URL}      http://${SERVER}/#/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    百达智慧内容安全监测平台

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    xpath://*[@id="app"]/div/div[2]/div/div/form/div[1]/div/div[1]/input    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    xpath://*[@id="app"]/div/div[2]/div/div/form/div[2]/div/div/input    ${password}

Input VerificationCode
    [Arguments]    ${verificationcode}
    Input Text    xpath://*[@id="app"]/div/div[2]/div/div/form/div[3]/div/div/input    ${verificationcode}

Submit Credentials
    Click Button    //*[@id="app"]/div/div[2]/div/div/form/div[4]/div/button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    百达智慧内容安全监测平台