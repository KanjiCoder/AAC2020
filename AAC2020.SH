
    ## IF you are tired, here is some busy work:
    ## TURN ON[ -Wconversion ]
    ## And start fixing where things break. 

    INN="./LIB/P5D1OGL.F_S._"
    OUT="./LIB/P5D1OGL.F_S.STRING._"
    awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

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
                                                               \
            -fstrict-aliasing                                  \
            -Wstrict-aliasing                                  \
                                                               \
            -Wno-overlength-strings                            \
                                                               \
            -std=c11                                           \
            -m64 ###############################################
                                    ####                    ####
    gcc -o EXE.exe object_file.o    ####                    ####                
    rm             object_file.o    ####                    ####     
         ./EXE.exe                  ####                    ####
    rm     EXE.exe                  ####                    ####
                                    ####                    ####
    read -p "[ENTER_TO_EXIT]:"      ####                    ####
    ############################################################

    ##_BUILD_SCRIPT_NOTES:(DOCUMENTATION)_######################
    ##
    ##      Wno-overlength-strings : 
    ##          Disable the 4095 iso-c99 embedded
    ##          string literal limit.
    ##
    ######################_BUILD_SCRIPT_NOTES:(DOCUMENTATION)_##

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