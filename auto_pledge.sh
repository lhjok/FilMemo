function green_print()
{
    local text=$@
    echo -e "\033[1m\033[32m${text}\033[0m"
}

function blue_print()
{
    local text=$@
    echo -e "\033[1m\033[36m${text}\033[0m"
}

function blue_print2()
{
    local text=$@
    echo -e "\033[36m${text}\033[0m"
}

function pledge()
{
    local text=$@
    ts=5
    idx=1
    green_print "pledge sectors process starting..."
    while ((idx<=5))
    do
        t=$(date +%Y_%m_%d_%H_%M)
        blue_print "${t}:"
        blue_print2 "pledge ${idx} sector"
        green_print "lotus-miner sectors pledge"
        lotus-miner sectors pledge
        blue_print2 "waitting ${ts} second..."

        echo -e ""
        let idx++
        sleep ${ts}s
    done
    blue_print "pledge ${text} complete"
}

tm=360
idxs=1
while ((idxs<=2000))
do
    pledge "${idxs}"
    blue_print2 "waitting ${tm} minutes..."
    let idxs++
    sleep ${tm}m
done
echo -e ""
