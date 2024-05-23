CMD [ "yarn", "run", "start" ] (uwaga: to polecenie CMD może być nadpisane przez command w docker-compose.yml)
Po zbudowaniu obrazu, Docker Compose przechodzi do uruchamiania kontenera api.
Polecenie command z pliku docker-compose.yml (bash -c "yarn && yarn run watch") nadpisuje polecenie CMD z Dockerfile i jest wykonywane w kontenerze.

Podsumowanie
Polecenia z Dockerfile są wykonywane jako pierwsze podczas budowania obrazu.
Po zbudowaniu obrazu, polecenia i konfiguracje z docker-compose.yml są stosowane do uruchomienia kontenera, w tym nadpisanie domyślnego polecenia CMD z Dockerfile przez command z docker-compose.yml.

CMD [ "yarn", "run", "start" ] ustawia domyślne polecenie do uruchomienia w kontenerze: yarn run start.
To polecenie uruchomi skrypt start zdefiniowany w package.json. Możesz nadpisać to polecenie w docker-compose.yml za pomocą command.
docker compose run --rm api sh -c "yarn && yarn build" MW zaleca pierwszy raz przy uruchamianiu µS, bez tego nie ma /code/dist
lepiej zrobić merge request -> do MW i wtedy MW merge'uje do branch:dewelopment

docker-compose up jest używane do uruchamiania aplikacji złożonych z wielu kontenerów na podstawie pliku konfiguracyjnego docker-compose.yml, 
podczas gdy docker run jest używane do uruchamiania pojedynczego kontenera na podstawie określonego obrazu Docker.

`docker-compose up` jest bardziej tradycyjną formą, podczas gdy `docker compose up` jest nowszą, skróconą formą używaną w nowszych wersjach Docker Compose.


Mapowanie portów: W przypadku docker compose run, mapowanie portów musi być jawnie określone, gdyż to polecenie uruchamia kontener jednorazowo i nie działa w taki sam sposób jak docker compose up, które uruchamia wszystkie usługi i mapuje porty zgodnie z konfiguracją.
Np.: docker compose run -p 3500:3500 api
Różnice widać w kolumnie PORTS po komendzie docker ps:
bez mapowania i flagi -p: 
3000/tcp, 3500/tcp
z flagą -p:
3000/tcp, 0.0.0.0:3500->3500/tcp, :::3500->3500/tcp
Usuwanie wszystkich kontenerów i images:

//docker rm -f $(docker ps -aq) && docker rmi -f $(docker images -aq)
docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q)

Verdacio: VPN Name: SSL VPN PWN, tylko tu jest dostęp do http://51.83.226.197:4873/ 
RUN npm set registry http://51.83.226.197:4873/

W środku kontenera:
docker exec -it 02bf912023d6 /bin/bash
cd src/config/passport/
grep -n "console.log" auth.ts



 
api-1  | [Node] Finder Client authorization failed /api/v1/: Client authorization failed (failures: 1). Next attempt in 20000 milis.
api-1  | [Node] Finder Client authorization failed /api/v1/: Client authorization failed (failures: 2). Next attempt in 20000 milis.
api-1  | [Node] Import of cached offers finished
api-1  | [Node] Import of onday offers ids started
