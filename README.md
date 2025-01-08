
```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@



Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

#### Ruby et rails avec Docker: ####
docker :
1ere lancement et lorsque changement de gems :
- docker-compose -p mast2testapp2 up --build 
pour ubuntu :
- docker compose -p mast2testapp2 up  --build

sinon :
- docker-compose  -p mast2testapp2 up

si besoin de nommer le conteneur :
- docker-compose -p mast2testapp2 exec web rails db:seed

docker-compose -p mast2testapp up 


ouvrire http://localhost:8000/


action pour rails (voir docker compose) :
- docker-compose exec web rails db:create
- docker-compose exec web rails db:seed
- docker-compose -p mast2testapp exec web  rails routes  

rebuild pour stimulus et js :
-docker-compose -p mast2testapp3 exec web bundle exec rails stimulus:manifest:update

exempe de création de produits avec scaffold :
Products[
name (string)
description (text)
price  (float)  
quantity (integer)
user (references)]

-> docker-compose exec web rails generate scaffold Product name:string description:text price:float quantity:integer user:references --no-stylesheets

Exemple pour faire des action rails :
-> docker-compose exec web rails db:migrate
-> docker-compose exec web rails db:seed

#### Ruby et rails en local: ####
installer ruby "3.2.2"

dans terminal :
bundle install
-yarn install`
-rails db:migrate
-rails db:seed

-rails s


## Si erreure ##
Jestion ereure serveur.pid
supprimer le fichier manuellement avec commande suivante :
rm -f tmp/pids/server.pid

probleme de saut de ligne :
- Aller dans le fichier bin et passer tout les ficier au format unix (crlf -> lf) (voir en bas a doit de visual studio code)
