alias php="docker exec $(docker ps -a | grep phpfpm | cut -d ' ' -f 1) php"
# alias composer="docker exec $(docker ps -a | grep phpfpm | cut -d ' ' -f 1) composer"  有bug, 这样其实无法在host机上执行composer install
alias composer='docker run --rm  -v `pwd`/:/current-dir -w /current-dir water/phpfpm7 composer' # 注意这里的单引号不要改动
alias mysql="docker exec -it $(docker ps -a | grep mysql | cut -d ' ' -f 1) mysql"
alias redis-cli="docker exec -it $(docker ps -a | grep redis | cut -d ' ' -f 1) redis-cli"
