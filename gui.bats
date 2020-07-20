#!/bin/bash/env bats
# CONFIGURAZIONI 
load config
NOME=GUI
VERSION=$(printf "$(date +%y%V)\x$((40 + $(date +%u)))")
TEMP=/tmp/gui/
#
@test "$NOME Prepare Environment" {
# controllo se esiste cartella 
if [ ! -d "$TEMP" ]; then
    mkdir $TEMP    
else
    # rimozione preventiva dei file dell'esecuzione precedente
    rm -f $TEMP*
fi
[[ "$status" -eq 0 ]]
}

@test "$NOME for page ben.php" {
nodejs ./js/makeben.js 0001.ref.tgz 0001.md   
[[ "$status" -eq 0 ]]
}
