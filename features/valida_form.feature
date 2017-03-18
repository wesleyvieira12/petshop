# encoding: utf-8
# language: pt
Funcionalidade: Preencher o formulário

  Cenário: Deve preencher todos os campos do forumlário e salvar com sucesso
    Dado que eu estou na página do formulario
    Quando eu preencher todos os campos
    E clicar em "Cadastrar"
    Então deve ver receber a mensagem "Cadastro realizado com sucesso"