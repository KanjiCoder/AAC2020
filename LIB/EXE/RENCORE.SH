    

    ##:_CREATE_BUILD_SYSTEM_EXECUTABLES_:====================:##
        ##----------------------------------------------------##
        ## PNG_HEX_DUMPer Utility For Embedding PNG File Data ##
        ##----------------------------------------------------##

        fip_inn="./RENCORE.C11" ## FIlePath:INNput            ##
        fip_out="./RENCORE.exe" ## FIlePath:OUTput            ##

        ##----------------------------------------------------##
        echo "[GCC_CMD_001]"
        gcc -x c                                               \
            -c $fip_inn                                        \
            -o rencore_object_file.obj                         \
            -std=c11                                           \
            -m64 ###############################################

        echo "[GCC_CMD_002]"
        gcc -o $fip_out rencore_object_file.obj 
        rm              rencore_object_file.obj
        ##----------------------------------------------------##
    ##:====================:_CREATE_BUILD_SYSTEM_EXECUTABLES_:##
    ##:TEST_OUT_RESULTING_EXE_FILE:==========================:##

        
        ./RENCORE.exe LOAD


    ##:==========================:TEST_OUT_RESULTING_EXE_FILE:##

                                                                                        \
    ## -Werror                                            \
    ## -Wfatal-errors                                     \
    ## -Wpedantic                                         \
    ## -Wall                                              \
    ## -Wextra                                            \                                       
    ## -fstrict-aliasing                                  \
    ## -Wstrict-aliasing                                  \
    ## -Wno-overlength-strings                            \
    ##                                                    \