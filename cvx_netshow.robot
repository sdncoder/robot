*** Settings ***
Documentation     Example test case using the gherkin syntax.
...

Library           SSHLibrary
Suite Setup       Open Connection And Log In
Suite Teardown    Close All Connections

*** Variables ***
${HOST}           172.20.20.6
${USERNAME}       root
${PASSWORD}       root

*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}     ${PASSWORD}

*** Test Cases ***
Verify Interface ETH0
    [Documentation]    Verify interface is up
    ${output}=         Execute Command    net show interface eth0
    Should Contain     ${output}          UP

Verify Interface SWP10
    [Documentation]    Verify interface is up
    ${output}=         Execute Command    net show interface swp10
    Should Contain     ${output}          UP

Ping remote interface
    [Documentation]    Ping swp10 10.10.10.38
    ${output}=         Execute Command    ping -c 1 10.10.10.38
    Should Contain     ${output}          64 bytes from 10.10.10.38

Shutdown interface
        [Documentation]    Shutdown swp10
        ${output}=         Execute Command    net add interface swp10 link down
        ${output}=         Execute Command    net commit
