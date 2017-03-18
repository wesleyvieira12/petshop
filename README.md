#Desafio para a Oportunidade Rails Developer



Descrição
-------------
Temos uma Pet Shop especializada em cachorros e queremos uma listagem simples, mas com filtro básicos, dos animais (cachorros) que já passaram pela Pet Shop.
Cada animal tem uma raça (você pode obter a listagem de raças em http://www.portalfilhotes.com.br/racas-de-a-z/), gênero (macho/fêmea), castrado (sim/não), data de nascimento, nome, nome do dono, telefone do dono e data da última vez que passou pela Pet Shop.
Para testar o software você precisa desenvolver também um gerador de 1.000 cachorros aleatórios para a Pet Shop.


----------


Requisitos
-------------

Ruby: 2.3.3
Ruby on Rails: 5.0.2

Como instalar
-------------

Primeiro você deve já ter instalado os requisitos acima. Apos a instalação você deve baixar o codigo do git fazendo o Download ou através do comando:
> git clone https://github.com/wesleyvieira12/petshop.git

O próximo passo você deve entrar na pasta onde esta o projeto baixado utilizando o terminal ou o CMD do windows e executar os seguintes comandos dentro dessa pasta:
>  **bundle install** - Baixa todas as gens declaradas no arquivo Gemfile
>  **rake db:migrate** - Cria o banco de dados e faz a migração das tabelas
>  **rake db:seed** - Cria dados para testes no banco de dados
>  **rails s** ou **rails server** ou **rails s -b 0.0.0.0**
