#!/bin/bash

# echo  $CF_Key $CF_Email
DOMAINS=/opt/config/domains.txt

# can be passed as an environmental variable..
# TEST="--test --debug"

usage () {
    cat <<EOF

    usage:

        issue - issue cert foreach domain in $DOMAINS
        renew - renew cert foreach domain in $DOMAINS

EOF

}


renew () {
    echo "renew";
    acme.sh $TEST --cron --home ${LE_WORKING_DIR}
}


issue () {
    echo "issue certs";
    for D in $(cat $DOMAINS | grep -v '^$\|^\s*\#' ); do
      echo -e "\t$D"
      if [ -n ${CF_Key} ]; then # cloudflare
        acme.sh $TEST --issue --dns dns_cf -d $D;
      else
        acme.sh $TEST --issue -d $D;
      fi
    done

}


CMD=$*;

if [ -z $CMD ]; then
  usage
  exit 1
fi

case "$CMD" in
    issue) issue;;
    renew) renew;;
    *) exec $CMD;;
esac
