# loop処理を使用したyamlのsh実行
SHELL="${0%*.sh}"
LOG="${SHELL}.log"
NAME=`name`

run() {
    export name=$1
    retry=2
    for i in $(seq 1 $retry); do
        echo "$i"
        embulk run -b bundle .$1yml.liquid
}
: > $LOG
RUN 'template'