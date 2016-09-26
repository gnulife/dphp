alias php="docker exec $(docker ps -a | grep phpfpm | cut -d ' ' -f 1) php"
alias composer="docker exec $(docker ps -a | grep phpfpm | cut -d ' ' -f 1) composer"