#!/bin/sh
cd "$(dirname "$0")"
sed -i "s/adminid/$ADMINID/g;s/apiid/$APIID/g;s/apihash/$APIHASH/g;s/bottoken/$BOTTOKEN/g;s/cpucore/$CORE/g;s/sthread/$THREAD/g" resources/config.yaml
if [ "$PROXY" != "0" ]; then
   sed -i "8i\ \ proxy:\ $PROXY" resources/config.yaml
fi
python3 main.py
