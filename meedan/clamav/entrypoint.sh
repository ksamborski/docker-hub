#!/bin/sh

#Init
#[[ -e /var/lib/clamav/*.cvd ]] && rm -f /var/lib/clamav/*.cvd
if [ ! -e /var/lib/clamav/main.cvd ]; then
  rm -f /var/lib/clamav/*.cvd
  #wget -q -O /var/lib/clamav/main.cvd http://database.clamav.net/main.cvd
  #wget -q -O /var/lib/clamav/daily.cvd http://database.clamav.net/daily.cvd
  #wget -q -O /var/lib/clamav/bytecode.cvd http://database.clamav.net/bytecode.cvd
  freshclam --show-progress
fi
chown clamav:clamav /var/lib/clamav/*.cvd

#Updater daemon
freshclam -d &

#ClamAV daemon
exec clamd
