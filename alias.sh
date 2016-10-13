alias php="docker exec $(docker ps -a | grep phpfpm | cut -d ' ' -f 1) php"
alias composer="docker exec $(docker ps -a | grep phpfpm | cut -d ' ' -f 1) composer"
alias mysql="docker exec -it $(docker ps -a | grep mysql | cut -d ' ' -f 1) mysql"
alias redis-cli="docker exec -it $(docker ps -a | grep redis | cut -d ' ' -f 1) redis-cli"