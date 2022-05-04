This README is written both in english and in brazilian portuguese.

# Introduction

This is a simple personal library API. It was created as part of a technical challenge for a job opening. In it, you can create an user (with email, password and name) which in turn can create book instances. In these instances, you can register the title (as "título"), author (as "autor"), genre (as "gênero"), if it was read or no (as "lido") and in case of a yes, give your rating (as "nota") and review (as "review").
Each user can only see the books they've created.

The user has the following options to see his books:
1) He can list all books
2) He can see individual books
3) He can search books by title, author or genre

# How to Use

Communication with the app is done via json requests. The following requests are available:

POST	/users	- User creation - instructions:	Send request as { "user": { "email": "example@email.com", "name": "example name", "password": "example", "password_confirmation": "example" } } - It will return a JSON with the new User authentication token.

DELETE	/users/sign_out	- Exit user session - Can send request without header or body, it will return 204 No Content.

POST	/users/sign_in	- Enter a session with an existing User. - Instructions: send body with {"user": {"email": "$user_email", "password": "$user_password"}} - It will return a JSON with the user info and token.

GET	/api/v1/livros - List all User books - 	Instructions: Send headers X-User-Email and X-User-Token

POST	/api/v1/livros - Register new book -	Instructions: Send headers X-User-Email and X-User-Token. Body: { "livro": {"título": "", "autor": ", "gênero": "", "lido": false (case true, send "nota" (from 0 to 5) and "review"}}

GET	/api/v1/search - Search -	Send headers X-User-Email and X-User-Token. Query params: título OR autor OR gênero

# Evaluation

## How much time did you end up spending on it?

I calculate around 12h of work. It was my first API-only Rails app.

## What are some of the design decisions you made?

User authorization was made with Pundit. Since this app is supposed to serve as a personal library, users can only see their own books. This was done via policy scopes.

To search, I used a gem called search_pg. It can be later programmed to deliver a better search experience than how it is now (more on that later).

## What do you like about your implementation?

I like that despite it being my first API-only Rails app it works as intended. All requested functionalities are present, and the token authorization works like a normal API.

## What would you improve next time?

* Make the search better. In the state the app is today, you can search by only one parameter. I'd like to implement multi-search, for example, books by X author that fit in Y genre instead of all books by X author.

* Add some restrictions. There are no restrictions on the password (e.g. at least 12 characters, symbols, etc), limit on characters for the other attributes.

* Token doesn't have an expiration. I'd like to make it more secure.

* Make it clear when the user is logged in or off. Make it easy for the user to check his token.

* Change the Book column names to english. As this was made for a brazilian company, I started using portuguese, but later figured out it was not a good practice, but wanted to focus on more important features that that for the time being instead of changing it to english.

-----

Read Me - Portuguese version

# Introdução

Esta é uma API de biblioteca pessoal simples. Foi criado como parte de um desafio técnico para uma vaga de emprego. Nele, você pode criar um usuário (com e-mail, senha e nome) que por sua vez pode criar instâncias do livro. Nesses casos, você pode registrar o título (como "título"), autor (como "autor"), gênero (como "gênero"), se foi lido ou não (como "lido") e em caso de sim , dê sua classificação (como "nota") e resenha (como "revisão").
Cada usuário pode ver apenas os livros que criou.

O usuário tem as seguintes opções para ver seus livros:
1) Ele pode listar todos os livros
2) Ele pode ver livros individuais
3) Ele pode pesquisar livros por título, autor ou gênero

# Modo de Uso

Comunicação com o app é feito através de requests JSON. Os seguintes requests são possíveis:

POST	/users	- Criação de Usuário - Instruções:	Mandar request como { "user": { "email": "example@email.com", "name": "example name", "password": "example", "password_confirmation": "example" } } - Vai retornar um JSON com o token de autenticação do novo usuário.

DELETE	/users/sign_out	- Log off - Pode mandar request sem nada, vai retornar 204 No Content.

POST	/users/sign_in	- Log In - Instruções: mandar body {"user": {"email": "$user_email", "password": "$user_password"}} - Vai retornar um JSON com o token de autenticação do usuário e mais informações

GET	/api/v1/livros - Listar todos os livros do usuário - 	Instruções: Mandar headers X-User-Email e X-User-Token

POST	/api/v1/livros - Registrar novo livro -	Instruções: Mandar headers X-User-Email e X-User-Token. Body: { "livro": {"título": "", "autor": ", "gênero": "", "lido": false (caso true, mandar "nota" (de 0 a 5) and "review"}}

GET	/api/v1/search - Search -	Mandar headers X-User-Email e X-User-Token. Query params: título OU autor OU gênero

## O que você gosta na sua implementação?

Eu gosto que, apesar de ser meu primeiro aplicativo Rails API-only, ele funciona como pretendido. Todas as funcionalidades solicitadas estão presentes e a autorização do token funciona como uma API normal.

## O que você melhoraria da próxima vez?

* Fazer um search melhor. No estado em que o aplicativo está hoje, você pode pesquisar por apenas um parâmetro. Eu gostaria de implementar a busca múltipla, por exemplo, livros do autor X que se encaixam no gênero Y em vez de todos os livros do autor X.

* Adicionar algumas restrições. Não há restrições quanto à senha (por exemplo, pelo menos 12 caracteres, símbolos, etc), limite de caracteres para os outros atributos.

* O token não tem validade. Eu gostaria de torná-lo mais seguro.

* Deixar claro quando o usuário está logado ou não. Facilitar para o usuário verificar seu token.

* Alterar os nomes das colunas do livro para inglês. Como isso foi feito para uma empresa brasileira, comecei a usar o português, mas depois descobri que não era uma boa prática, mas queria focar em recursos mais importantes que isso por enquanto em vez de mudar para inglês.



