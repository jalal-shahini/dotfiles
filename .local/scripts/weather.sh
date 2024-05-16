#!/bin/bash
# Based on http://openweathermap.org/current

API_KEY="725e7a96e9f04e4ee6f86c7a2e9da236"

# Check on http://openweathermap.org/find
CITY_ID="2949186"

URGENT_LOWER=0
URGENT_HIGHER=40


ICON_PRESSURE="🅿️"
ICON_TEMP_FEEL="🌡️"
ICON_WIND="🌬️"
ICON_SUNRISE="🌅"
ICON_SUNSET="🌇"
ICON_HUMIDITY="💧"




SYMBOL_CELSIUS="°"
WEATHER_URL="http://api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&appid=${API_KEY}&units=metric"

WEATHER_INFO=$(wget -qO- "${WEATHER_URL}")

# Check if the wget was successful. If not read the previously stored data. 0 means "All OK!"
if [ $? -eq 0 ]; then
    echo "Online" > /dev/null
else
    echo "⚠️" &
    notify-send "No Internet Connection"
    exit
fi


ICON=$(echo "${WEATHER_INFO}" | grep -o -e '"icon":"[a-zA-Z0-9]*"' | awk -F ':' '{print $2}' | tr -d '"') > /dev/null



WEATHER_TEMP=$(echo "${WEATHER_INFO}" | grep -o -e '"temp":-\?[0-9]*\.\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"') > /dev/null
WEATHER_TEMP_FEEL=$(echo "${WEATHER_INFO}" | grep -o -e '"feels_like":-\?[0-9]*\.\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"') > /dev/null
WEATHER_WIND_SPEED=$(echo "${WEATHER_INFO}" | grep -o -e '"speed":-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"') > /dev/null
WEATHER_WIND_DEG=$(echo "${WEATHER_INFO}" | grep -o -e '"deg":-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"') > /dev/null
SUNRISE_EPOCH=$(echo "${WEATHER_INFO}" | grep -o -e '"sunrise":-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"') > /dev/null
SUNRISE=$(echo "${SUNRISE_EPOCH}" | xargs -i date -d @{} | grep -o -e "[0-9]*:[0-9]*:[0-9]*") > /dev/null
SUNSET_EPOCH=$(echo "${WEATHER_INFO}" | grep -o -e '"sunset":-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"') > /dev/null
SUNSET=$(echo "${SUNSET_EPOCH}" | xargs -i date -d @{} | grep -o -e "[0-9]*:[0-9]*:[0-9]*") > /dev/null
PRESSURE=$(echo "${WEATHER_INFO}" | grep -o -e '"pressure":-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"') > /dev/null
HUMIDITY=$(echo "${WEATHER_INFO}" | grep -o -e '"humidity":-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"') > /dev/null
TIME=$(date +"%H")


if [[ $WEATHER_WIND_DEG > 337.5 ]]; then
    ICON_WIND_DIR="⬇️"
elif [[ $WEATHER_WIND_DEG > 292.5 ]]; then
    ICON_WIND_DIR="↘️"
elif [[ $WEATHER_WIND_DEG > 247.5 ]]; then
    ICON_WIND_DIR="➡️"
elif [[ $WEATHER_WIND_DEG > 202.5 ]]; then
    ICON_WIND_DIR="↗️"
elif [[ $WEATHER_WIND_DEG > 157.5 ]]; then
    ICON_WIND_DIR="⬆️"
elif [[ $WEATHER_WIND_DEG > 122.5 ]]; then
    ICON_WIND_DIR="↖️"
elif [[ $WEATHER_WIND_DEG > 67.5 ]]; then
    ICON_WIND_DIR="⬅️"
elif [[ $WEATHER_WIND_DEG > 22.5 ]]; then
    ICON_WIND_DIR="↙️"
else
    ICON_WIND_DIR="⬇️"
fi


if [[ "$(date +%s)" < "${SUNSET}" ]] & [[ "$(date +%s)" > "${SUNRISE}" ]] ; then
    echo "${WEATHER_TEMP} ${SYMBOL_CELSIUS}"
else
    echo "${WEATHER_TEMP} ${SYMBOL_CELSIUS}"
fi



if [[ $1 = "-f" ]]; then
    notify-send "Bielefeld" "${ICON_TEMP_FEEL}\t\t ${WEATHER_TEMP_FEEL}${SYMBOL_CELSIUS} \n${ICON_PRESSURE}\t\t ${PRESSURE} Pa\n${ICON_WIND}\t\t ${WEATHER_WIND_SPEED}m/s ${ICON_WIND_DIR}\n${ICON_SUNRISE}\t\t ${SUNRISE} \n${ICON_SUNSET}\t\t ${SUNSET} \n${ICON_HUMIDITY}\t\t ${HUMIDITY}%" --icon="$HOME/.local/share/weather/$ICON.png"
fi


if [[ "${WEATHER_TEMP}" < "${URGENT_LOWER}" ]] || [[ "${WEATHER_TEMP}" > "${URGENT_HIGHER}" ]]; then
  exit 33
fi

