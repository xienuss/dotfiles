mode=$(makoctl mode | grep dnd)

if [ -n "$mode" ]; then
  echo '{"text": "do_not_disturb_on", "class": "on"}'
else
  echo '{"text": "do_not_disturb_on", "class": "off"}'
fi
