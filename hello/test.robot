*** Settings ***
Library     app.py



*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=      Welcome     Fernando
    Should Be Equal  ${result}      Olá Fernando, Bem vindo ao Curso básico de Robot Framework!