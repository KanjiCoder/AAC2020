
    ##  SC[ hkmf-mini] #########################################
    ## SEE[ hkmf-c11 ] for reference:  #########################
    ############################################################
    gcc                                                        \
        -x c                                                   \
        -c "AAC2020.C11"                                       \
        -o object_file.o                                       \
                                                               \
            -Werror                                            \
            -Wfatal-errors                                     \
            -Wpedantic                                         \
            -Wall                                              \
            -Wextra                                            \
                                                               \
            -fstrict-aliasing                                  \
            -Wstrict-aliasing                                  \
                                                               \
            -D MACRO_COMPILE_ONLY_THIS_FILE_AS_DEMO            \
                                                               \
            -std=c11                                           \
            -m64 ###############################################
                                    ####                    ####
    gcc -o EXE.exe object_file.o    ####                    ####                
    rm             object_file.o    ####                    ####     
         ./EXE.exe                  ####                    ####
### rm     EXE.exe                  ####                    ####
                                    ####                    ####
    read -p "[ENTER_TO_EXIT]:"      ####                    ####
    ############################################################

    ############################################################
    ## GCC NOTES:                                             ##
    ##      I think this is how you configure the linker      ##
    ##      for SFML if NOT using an IDE. But we are not      ##
    ##      using SFML for this project so made this a        ##
    ##      foot note. DATE[2020_10_24]                       ##
    ##                                                        ##
    ## HEADERS.H    --> /include (Compiler Search Directories)##
    ## LIBRARIES.A  --> /lib     (Linker   Search Directories)##
    ##                                                        ##
    ##  -IDEP/CSFML/include                                    \
    ##  -LDEP/CSFML/lib/gcc                                    \
    ##                                                         \
    ##      -lsfml-graphics                                    \
    ##      -lsfml-window                                      \
    ##      -lsfml-system                                      \
    ############################################################