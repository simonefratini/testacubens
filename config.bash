#!/bin/bash
function check_command()
{
    ESISTE=$(which $1)
    if [ -z "$ESISTE" ]; then
        echo "Missing $1 command!"
        exit 1;
    fi 
    echo $ESISTE 
}

# check i comandi 
TESTJS="nodejs ./js/puppeteer.js"
JQ=$(check_command jq)
BENGEN_URL="http://ktulu/"



