##################################################
############################# SC[ hkmf-c11 ] #####
##################################################
base_name_no_extension="PEB2020"
##################################################
                                          ## 11 ##
                                          ##____##
MY_COMMAND_STRING=$(cat << GCC_COMMAND_01
    gcc                                     
    -x c                                    
    -c $base_name_no_extension.C11          
    -o my_object_file.o                     
    -m64                                    
GCC_COMMAND_01
)                          
                                          ##¯¯¯¯##
                                          ## 11 ##
C=$MY_COMMAND_STRING  ############################
C=$C"-Werror        " ## WarningsAreErrors      ##
C=$C"-Wfatal-errors " ## StopAtFirstError       ##
C=$C"-Wpedantic     " ## UseStrictISO_C         ##
C=$C"-Wall          " ## WarnAboutAnyWeirdCode  ##
C=$C"-Wextra        " ## "-Wall" WarningsExtra  ##
C=$C"-std=c11       " ## VersionOf_C_ToUse      ##
MY_COMMAND_STRING=$C  ############################
                                          ## 11 ##
echo $MY_COMMAND_STRING                   ## 11 ##
     $MY_COMMAND_STRING                   ## 11 ##
                                          ## 11 ##
C1=" gcc -o EXE.exe my_object_file.o "    ## 11 ##
C2=" ./EXE.exe                       "    ## 11 ##
C3=" rm my_object_file.o             "    ## 11 ##
C4=" rm EXE.exe                      "    ## 11 ##
$C1 && echo "OK:"$C1 || "FAIL:$C1"        ## 11 ##
$C2 && echo "OK:"$C2 || "FAIL:$C2"        ## 11 ##
$C3 && echo "OK:"$C3 || "FAIL:$C3"        ## 11 ##
$C4 && echo "OK:"$C4 || "FAIL:$C4"        ## 11 ##
##################################################
read -p "[END_OF_BUILD_SCRIPT:PressAnyKey]:"
##################################################
############################# SC[ hkmf-c11 ] #####
##################################################