DNStest(){
TIME1=$(date "+%s")
traceroute $1 2>&1 > /dev/null
TIME2=$(date "+%s")
echo $(($TIME2 - $TIME1))
}

if [ ! "$1" ]
then
	echo "Usage: resolve-time.sh [host] [count] (count is optional and defaults to 5)"
	exit 1
fi

if [ "$2" ]
	then COUNT="$2"
else
	COUNT=5
fi

SECONDS=0

for ((i=0; i<$COUNT; i++))
do
	echo "Pass #$(($i+1))"
	ATTEMPT=$(DNStest $1)
	SECONDS=$(($SECONDS + $ATTEMPT))
	if [ $i -lt $(($COUNT - 1)) ]
		then sleep 3 &
		wait
	fi
done

echo "The average DNS resolve time was $(($SECONDS / $COUNT)) seconds."
