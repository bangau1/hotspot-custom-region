DATE=`date '+%Y-%m-%d %H:%M:%S'`
TARGET_COUNTRY="US"
NAME="custom-region"
TARGET_COUNTRY="US"

sys_print(){
    local msg=$1
    local priority=$2
    echo "[${NAME}] $msg" 
    echo "[${NAME}] $msg" | systemd-cat -p $priority
}



sys_print "hostpot-custom-region started at ${DATE}" "info"
while :
do
    sys_print "Checking the wireless region country..." "info"
    COUNTRY=`sudo iw reg get | grep country | awk '{print $2}' | cut -d':' -f1`
    sys_print "COUNTRY is ${COUNTRY}" "info"
    if [[ "${COUNTRY}" != "${TARGET_COUNTRY}" ]]; then
	# this 98 country code somehow shown even after `sudo iw reg set US`. But the 5Ghz channel is enabled. So this is working. Still looking on why this number appears: https://raspberrypi.stackexchange.com/questions/108097/how-to-change-wi-fi-country-in-raspberry-pi-4
	if [[ "${COUNTRY}" != "98" ]]; then
	    sys_print "Changing back to ${TARGET_COUNTRY} as the current COUNTRY=${COUNTRY}" "notice" 
	    sudo iw reg set ${TARGET_COUNTRY} 
	    sudo systemctl restart hostapd.service
	    
	    sys_print "Succesfully change region to US" "notice"
	else
	    sys_print "Nothing to do.." "info"
	fi
    else
	sys_print "Nothing to do.." "info"
    fi
    sleep 30;
done
