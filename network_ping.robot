*** Settings ***
Documentation     Example test case using the gherkin syntax.
...

Library           SSHLibrary
Suite Setup       Open Connection And Log In
Suite Teardown    Close All Connections

*** Variables ***
${HOST}           10.0.0.178
${USERNAME}       netadmin
${PASSWORD}       Plunder&79

*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}     ${PASSWORD}

*** Test Cases ***
Internet Connectivity Ping test
    [Documentation]    Ping Test To 8.8.8.8
    ${output}=         Execute Command    ping 8.8.8.8 -c 1
    Should Contain     ${output}          64 bytes from 8.8.8.8
