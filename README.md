# README

Projeto desenvolvido para o teste da empresa Mobile2You


## Instalação

    bundle install
    rails db:migrate

## Run the app

    rails s


## Run the tests

    rspec

# TESTE DE LÓGICA

Dado um conjunto de caracteres, você precisará extrair os "diamantes" ( <>) e as "areias" ( . ) da expressão e no
final exibir a quantidade de diamantes extraídos
Expressão: <<.<<..>><>><.>.>.<<.>.<.>>>><>><>>

## Endereço
localhost:3000

## Controller
pages_controller.rb

## View
home.html.erb


# REST API

Este projeto cria um endpoint que faz leitura de um arquivo .csv, popula o banco de dados com essas informações e exibe todos os registros em json.

## Get list of Titles

### Request

`GET /titles`

    curl -i -H 'Accept: application/json' http://localhost:3000/api/v1/titles

### Response

    [{"id":93,"genre":"Movie","title":"A Clockwork Orange","country":"United Kingdom, United States","date_added":"2020-11-01","published_at":1971,"description":"In this dark satire from director Stanley Kubrick, a young, vicious sociopath in a dystopian England undergoes an experimental rehabilitation therapy."}]


## Get a specific Title

### Request

`GET /titles/id`

    curl -i -H 'Accept: application/json' http://localhost:3000/api/v1/titles/1

### Response

    {"status":"SUCCESS","message":"Showed","data":{"id":1,"show_id":"s64","genre":"TV Show","title":"13 Reasons Why","director":null,"cast":"Dylan Minnette, Katherine Langford, Kate Walsh, Derek Luke, Brian d'Arcy James, Alisha Boe, Christian Navarro, Miles Heizer, Ross Butler, Devin Druid, Michele Selene Ang, Steven Silver, Amy Hargreaves","country":"United States","date_added":"2020-06-05","published_at":2020,"rating":0.0,"duration":"4 Seasons","listed_in":"Crime TV Shows, TV Dramas, TV Mysteries","description":"After a teenage girl's perplexing suicide, a classmate receives a series of tapes that unravel the mystery of her tragic choice.","created_at":"2021-11-15T18:15:25.810Z","updated_at":"2021-11-15T18:15:25.810Z"}

## Change a Title

### Request

`PUT /titles/:id`

    curl -i -X PUT -H "Content-Type: application/json" -d '{"title":"new_title"}' "http://localhost:3000/api/v1/titles/1"


### Response

    {"status":"SUCCESS","message":"Updated","data":{"id":1,"title":"new_title","show_id":"s64","genre":"TV Show","director":null,"cast":"Dylan Minnette, Katherine Langford, Kate Walsh, Derek Luke, Brian d'Arcy James, Alisha Boe, Christian Navarro, Miles Heizer, Ross Butler, Devin Druid, Michele Selene Ang, Steven Silver, Amy Hargreaves","country":"United States","date_added":"2020-06-05","published_at":2020,"rating":0.0,"duration":"4 Seasons","listed_in":"Crime TV Shows, TV Dramas, TV Mysteries","description":"After a teenage girl's perplexing suicide, a classmate receives a series of tapes that unravel the mystery of her tragic choice.","created_at":"2021-11-15T18:15:25.810Z","updated_at":"2021-11-15T21:25:13.563Z"}



## Delete a Title

### Request

`DELETE /titles/id`

    curl -i -H 'Accept: application/json' -X DELETE http://localhost:3000/api/v1/titles/5

### Response

  {"status":"SUCCESS","message":"Deleted","data":{"id":5,"show_id":"s69","genre":"Movie","title":"14 Blades","director":"Daniel Lee","cast":"Donnie Yen, Zhao Wei, Wu Chun, Law Kar-Ying, Kate Tsui, Yuwu Qi, Wu Ma, Chen Kuan Tai, Sammo Kam-Bo Hung, Chen Zhi Hui, Damian Lau, Xiang Dong Xu","country":"Hong Kong, China, Singapore","date_added":"2019-04-03","published_at":2010,"rating":0.0,"duration":"113 min","listed_in":"Action \u0026 Adventure, International Movies","description":"In the age of the Ming Dynasty, Quinglong is the best of the Jinyiwei, an elite assassin squad made up of highly trained former street urchins. When evil eunuch Jia unseats the emperor, Quinglong is called to action but is quickly betrayed.","created_at":"2021-11-15T18:15:25.894Z","updated_at":"2021-11-15T18:15:25.894Z"}


## Import a CSV

### Request

`GET titles/import`

  curl --location --request POST 'localhost:3000/api/v1/titles/import' \
  --header 'X-CSRF-TOKEN: V/cofXvPcIGzmeJM5rnBOe/MoxJTa53cMWvs5o538SmLpK9PvTMxAWg04P5odsKpBdOBmcaOqhistRtONe6Ung==' \
  --header 'Cookie: _api_mobile_session=FoN5AH8eNGmpk83d6UMVnqQhywLpFRf8F4TI2J28VhPZYA%2F1oO1F%2B%2FVaup4BPg8YLFNav7PNvRpzX5wWRjmnUvLQmBqxxem5wCooze35A%2BKDBisZHHq7DDcTI5Iiz9ZNCRp1bg4W4YKUOFJK%2FJ9WnXfxpxjannLWaRGuYvipX9C%2ByvWLk8SAQxapi6eeAzZydIv3Q5Nk9oRnuk6MHe4ZbY7k5%2BXz3C4WctaqIIFxKvQpcD02hG%2BoVNfq9%2B%2B6EiZ5xhf9b8MwGgi56nv%2BeNIO12PoXKjgTT0%2BkNPx6RAyYhn%2B9LHEAdNU4k%2FSdE%2F8BPe4G9zream5HW9bXrEv012eAsqAqwYZPhFSmnZcQa3QvZEpTkZr0Yxw7cVEGVVR57n0S31ghqA7i11mCdxxB24b--bviT6Ei%2FabRoxmt8--4j242Z2wC6OdRPh%2BQ7cJDQ%3D%3D' \
  --form 'file=@"lib/seeds/netflix_titles.csv"'

### Response

    {"status":"SUCCESS","message":"Imported"}
