#!/bin/bash

####################
#
#	VSH
#	Description : This script allows you to...
#
#
#
####################

source client.sh

function usage {
echo "usage: $(basename $0) OPTION [-list, -browse, -extract] HOST PORT ARCHIVE [archive must finish by .arch]"
}

function main {

ValidIpAddressRegex="^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$";
ValidHostnameRegex="^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$";
ValidPortRegex="^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$"

if [[ $1 == "-list" || $1 == "-browse" ]]; then

      HOST=$2
		  PORT=$3

      if [[ $HOST =~ $ValidIpAddressRegex || $HOST =~ $ValidHostnameRegex  && $PORT =~ $ValidPortRegex ]]; then

        #Call client.sh in order to make the request to the server
        execute_command "$@"

      else

        usage

      fi


elif [[ $1 == "-extract" ]]; then

      HOST=$2
      PORT=$3
      ARCHIVE=$4

      if [[ $HOST =~ $ValidIpAddressRegex || $HOST =~ $ValidHostnameRegex  && $PORT =~ $ValidPortRegex && $ARCHIVE != .arch$ ]]; then

        #Call client.sh in order to make the request to the server
        execute_command "$@"

      else
        usage
      fi
else
     usage
fi
}

#Launch the main function
main "$@"

exit 0
