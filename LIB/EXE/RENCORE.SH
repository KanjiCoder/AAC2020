    

    ##:_CREATE_BUILD_SYSTEM_EXECUTABLES_:====================:##
        ##----------------------------------------------------##
        ## PNG_HEX_DUMPer Utility For Embedding PNG File Data ##
        ##----------------------------------------------------##

        fip_inn="./RENCORE.C11" ## FIlePath:INNput            ##
        fip_out="./RENCORE.exe" ## FIlePath:OUTput            ##

        ##----------------------------------------------------##
        gcc -x c                                               \
            -c $fip_inn                                        \
            -o rencore_object_file.obj                         \
                                                               \
            -Werror                                            \
            -Wfatal-errors                                     \
            -Wpedantic                                         \
            -Wall                                              \
            -Wextra                                            \                                        \
            -fstrict-aliasing                                  \
            -Wstrict-aliasing                                  \
            -Wno-overlength-strings                            \
                                                               \
            -std=c11                                           \
            -m64 ###############################################

        gcc -o $fip_out rencore_object_file.obj 
        rm              rencore_object_file.obj
        ##----------------------------------------------------##
    ##:====================:_CREATE_BUILD_SYSTEM_EXECUTABLES_:##