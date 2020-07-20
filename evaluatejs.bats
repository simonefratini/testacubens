#!/bin/bash/env bats
# CONFIGURAZIONI 
load config
NOME="Evaluate asynchronous Javascript"
#
TEMP=/tmp/evaluate/
REFPATH=view
PAGINA=$BENGEN_URL$REFPATH

@test "$NOME Prepare Environment" {
skip "Non necessario"
# controllo se esiste cartella 
if [ ! -d "$TEMP" ]; then
    mkdir $TEMP    
else
    # rimozione preventiva dei file dell'esecuzione precedente
    rm -f $TEMP*
fi
}

@test "$NOME for page bootloader.php" {
$TESTJS $PAGINA/bootloader.php          
[[ "$status" -eq 0 ]]
}
@test "$NOME for page check_firmware.php" {
$TESTJS $PAGINA/check_firmware.php      
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page componente.php" {
$TESTJS $PAGINA/componente.php          
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page diff_firmware.php" {
$TESTJS $PAGINA/diff_firmware.php       
[[ "$status" -eq 0 ]]
}
@test "$NOME for page firmware.php" {
$TESTJS $PAGINA/firmware.php            
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page header_field.php" {
$TESTJS $PAGINA/header_field.php        
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page package.php" {
$TESTJS $PAGINA/package.php           
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page processor.php" {
$TESTJS $PAGINA/processor.php           
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page repository.php" {
$TESTJS $PAGINA/repository.php          
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page settings.php" {
$TESTJS $PAGINA/settings.php            
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page v_datasheet_header.php" {
$TESTJS $PAGINA/v_datasheet_header.php  
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page v_datasheet.php" {
$TESTJS $PAGINA/v_datasheet.php         
[[ "$status" -eq 0 ]]
 }
@test "$NOME for page v_family.php" {
$TESTJS $PAGINA/v_family.php            
[[ "$status" -eq 0 ]]
}
@test "$NOME for page v_product_model.php" {
$TESTJS $PAGINA/v_product_model.php    
[[ "$status" -eq 0 ]]
}
@test "$NOME for page ben.php" {
$TESTJS $PAGINA/ben.php    
[[ "$status" -eq 0 ]]
}
@test "$NOME for page tib.php" {
$TESTJS $PAGINA/tib.php    
[[ "$status" -eq 0 ]]
}
@test "$NOME for page git.php" {
$TESTJS $PAGINA/git.php    
[[ "$status" -eq 0 ]]
}
