*** Settings ***
Library    OperatingSystem
Library    DiffLibExt

*** Variables ***
${data_dir}    ${CURDIR}${/}data
${error_msg}    *HTML* <b><a href='*__diff__${/}diff_*.html'>Differences Found</a></b>

*** Test Cases ***
test file should be equal pass
    File Should Be Equal
    ...    ${data_dir}${/}example1.json
    ...    ${data_dir}${/}example1.json

test file should be equal raise
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    File Should Be Equal
    ...    ${data_dir}${/}example1.json
    ...    ${data_dir}${/}example2.json

test text should be equal pass
    ${text1}=    Get File    ${data_dir}${/}example1.json
    ${text2}=    Get File    ${data_dir}${/}example1.json
    Text Should Be Equal    ${text1}    ${text2}

test text should be equal raise
    ${text1}=    Get File    ${data_dir}${/}example1.json
    ${text2}=    Get File    ${data_dir}${/}example2.json
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    Text Should Be Equal
    ...    ${text1}
    ...    ${text2}

test dict should be equal pass
    ${text1}=    Get File    ${data_dir}${/}example1.json
    ${text2}=    Get File    ${data_dir}${/}example1.json
    ${dict1}=    Evaluate    json.loads($text1)
    ${dict2}=    Evaluate    json.loads($text2)
    Dict Should Be Equal    ${dict1}    ${dict2}

test dict should be equal raise
    ${text1}=    Get File    ${data_dir}${/}example1.json
    ${text2}=    Get File    ${data_dir}${/}example2.json
    ${dict1}=    Evaluate    json.loads($text1)
    ${dict2}=    Evaluate    json.loads($text2)
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    Dict Should Be Equal
    ...    ${dict1}
    ...    ${dict2}
