*** Settings ***
Library    OperatingSystem
Library    DiffLibExt   line_wrap_len=99
Variables    var/var.py

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
    Object Should Be Equal    ${dict1}    ${dict2}

test dict should be equal raise
    ${text1}=    Get File    ${data_dir}${/}example1.json
    ${text2}=    Get File    ${data_dir}${/}example2.json
    ${dict1}=    Evaluate    json.loads($text1)
    ${dict2}=    Evaluate    json.loads($text2)
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    Object Should Be Equal
    ...    ${dict1}
    ...    ${dict2}

test list json obj should be equal raise
    ${text1}=    Get File    ${data_dir}${/}json_list1.json
    ${text2}=    Get File    ${data_dir}${/}json_list2.json
    ${dict1}=    Evaluate    json.loads($text1)
    ${dict2}=    Evaluate    json.loads($text2)
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    Object Should Be Equal
    ...    ${dict1}
    ...    ${dict2}

test data class should be equal
    Object Should Be Equal    ${var1}    ${var2}

test data class should be equal fail
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    Object Should Be Equal
    ...    ${var1}
    ...    ${var3}

test data class list should be equal
    Object Should Be Equal    ${var_list1}    ${var_list2}

test data class list should be equal fail
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    Object Should Be Equal
    ...    ${var_list1}
    ...    ${var_list3}

test py obj should be equal
    Object Should Be Equal    ${var_obj1}    ${var_obj2}

test py obj should be equal fail
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    Object Should Be Equal
    ...    ${var_obj1}
    ...    ${var_obj3}

test py obj list should be equal
    Object Should Be Equal    ${var_obj1}    ${var_obj2}

test py obj list should be equal fail
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    Object Should Be Equal
    ...    ${var_obj1}
    ...    ${var_obj3}

test obj complex should be equal
    Object Should Be Equal    ${var_obj_complex1}    ${var_obj_complex2}


test obj complex should be equal fail
    Run Keyword And Expect Error
    ...    ${error_msg}
    ...    Object Should Be Equal
    ...    ${var_obj_complex1}
    ...    ${var_obj_complex3}