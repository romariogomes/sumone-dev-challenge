# SumOne Programming Challenge

## The drink searcher

### Introdução

Na SumOne, utilizamos RubyOnRails na maioria das soluções que desenvolvemos,
mas estamos atentos também a frameworks javascripts para criar soluções
com a melhor usabilidade possível para nossos clientes.

Queremos que você não só seja um _developer_ efetivo mas que também saiba
desenvolver aplicativos que façam parte de uma arquitetura maior. É preciso
capacidade de organização, documentação e abstração para conceber tais
sistemas, e é nesses aspectos que vamos mirar nesse desafio.

### Requisitos para rodar o projeto

O projeto está utilizando o ruby versão `2.4.1`. A versão do rails é a `5.1.4`.

Para criar o banco de dados:

`$ bundle exec rails db:create db:migrate db:seed`

*OBS:* Não esqueça de rodar o `db:seed` pois já pré-cadastramos uma série de drinks com diversos atributos
para você realizar seus testes.


#### Objetivo geral
Implementar novas funcionalidades ao um sistema de busca e recomendação de drinks.

#### Objetivos específicos

* Implementar a "Easy Search", ou seja, uma busca simples apenas por nome do drink. Essa busca deve
ordenar os drinks por nome e data de criação. Além disso, deve ser feito paginação, com 10 items por página. Adicionar testes referentes as funcionalidades,
utilizando a estrutura já existente no projeto com o RSPEC. O teste deve ser capaz de verificar a funcionalidade de busca por texto e da ordenação.

* Implementar a "Recommended Search", ou seja, a busca por recomendação de drink. No model Drink, existem diversos
atributos que são características comuns de um drink. Através da busca por recomendação, o usuário deve ser capaz
de inserir informações sobre essas características para que seja retornada uma lista de drinks. Essa lista
deve estar ordenada pelo critério de qual drink satisfaz melhor os campos inseridos pelo usuário. Além disso, drinks que não
satisfizerem a recomendação, não devem aparecer na listagem. O algoritmo de recomendação deve ser de sua escolha/criatividade.
Aproveite para inovar aqui, pois é onde queremos ver sua maneira de resolver problemas.

* A disposição e tipo dos campos utilizados na view para "Recommended Search" podem ser escolhido por você (Ex: CheckBox, Botão, Slider, Select, etc..).
Lembrando que é apenas necessário que o usuário possa escolher entre todos os atributos disponíveis (não é necessário nome e descrição)
para essa busca no model de Drink.

* Adicionar os testes unitários referentes ao algoritmo implementada na "Recommended Search".

#### Sugestões espertas ;)

* As buscas podem ser implementadas de maneira assíncrona via javascript, sem a necessidade de recarregar a página cada
vez que o usuário realizar uma busca.

* O campo de descrição do Drink também contém informações interessantes para realizar a "Recommended Search" :)

* Também é legal fazer algum teste para as views.

* Facilite a sua e a nossa vida, coloque o projeto no heroku ou outra plataforma :).

* Você pode utilizar algumas `gems` para o que julgar necessário. Mas o algoritmo de recomendação é de sua responsabilidade.
