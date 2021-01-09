#!/usr/bin/with-contenv bashio
CorF=$(cat options.json |jq -r '.CorF')
until false; do 
  read cpuRawTemp</sys/class/thermal/thermal_zone0/temp #read instead of cat fpr process reductionread cpuRawTemp</sys/class/thermal/thermal_zone0/temp #read instead of cat fpr process reduction
  cpuTemp=$(( $cpuRawTemp / 1000 ))
  unit="C"
  if [ $CorF == "F" ]; then
    cpuTemp=$(( ( $cpuTemp *  9/5 ) + 32 ));
    unit="F"
  fi
  echo "Current Temperature $cpuTemp °$unit"
  curl -s -X POST -H "Content-Type: application/json"  -H "Authorization: Bearer $HASSIO_TOKEN" -d '{"state": "'$cpuTemp'", "attributes":  {"unit_of_measurement": "°'$unit'", "icon": "mdi:clock-start", "friendly_name": "CPU Temp"}}' http://hassio/homeassistant/api/states/sensor.cpu_temp 2>/dev/null
  sleep 30;
done
