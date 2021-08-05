#! /usr/bin/env bash

status(){
  connected_val="$(iwgetid 1> /dev/null ; echo $?)"
  if [ "$connected_val" -eq 255 ]; then
    echo '{"text": "⚠ Disconnected", "class":"disconnected"}'
    return
  else
    wg_val="$(wg 2> /dev/null ; echo $?)"
    if [ "$wg_val" -eq 0 ]; then
      echo "{\"text\": \" $(iwgetid -r)\", \"class\":\"connected\"}"
    else
      echo "{\"text\": \"聯 $(iwgetid -r)\", \"class\":\"secured\"}"
    fi
  fi
}

onclick(){
  wg_val="$(wg 2> /dev/null ; echo $?)"
  if [ "$wg_val" -eq 0 ]; then
    echo "Securing Connection"
    wg-quick up mullvad-us18
  else
    echo "Disconnecting tunnel"
    wg-quick down mullvad-us18
  fi
}

case "$1" in
    onclick|status) $1 ;;
esac
