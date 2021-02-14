
    ## IF you are tired, here is some busy work:
    ## TURN ON[ -Wconversion ]
    ## And start fixing where things break. 

    ##:_CREATE_BUILD_SYSTEM_EXECUTABLES_:====================:##
        ##----------------------------------------------------##
        ## PNG_HEX_DUMPer Utility For Embedding PNG File Data ##
        ##----------------------------------------------------##

        fip_inn="./LIB/EXE/PHEXDUM.C11" ## FIlePath:INNput    ##
        fip_out="./LIB/EXE/PHEXDUM.exe" ## FIlePath:OUTput    ##

        ##----------------------------------------------------##
        gcc -x c                                               \
            -c $fip_inn                                        \
            -o phexdum_object_file.obj                         \
            -std=c11                                           \
            -m64 ###############################################
            gcc -o $fip_out phexdum_object_file.obj 
            rm              phexdum_object_file.obj
        ##----------------------------------------------------##
    ##:====================:_CREATE_BUILD_SYSTEM_EXECUTABLES_:##
    ##_GENERATE_HARDASS_PNG_ASSETS_#############################

        original_directory=$PWD
        cd ./LIB/ASS

        ##:[ASS_001]:----------------------------------------:##
        ## MAKE(S): I32 PAINT5D_DEFAULT_DATA_001_NOE ###########
        ## MAKE(S): U32 PAINT5D_DEFAULT_DATA_001_PNG ###########
        ../EXE/PHEXDUM.exe                                     \
            pngfile_CTO_naktext                                \
                PAINT5D_DEFAULT_DATA_001.PNG                   \
                PAINT5D_DEFAULT_DATA_001_NAK._                 \
                PAINT5D_DEFAULT_DATA_001_NOE._ ##-------------##
        ##:----------------------------------------:[ASS_001]:##
        ##:[ASS_002]:----------------------------------------:##
        ## MAKE(S): I32 PAINT5D_DEFAULT_DATA_002_NOE ###########
        ## MAKE(S): U32 PAINT5D_DEFAULT_DATA_002_PNG ###########
        ../EXE/PHEXDUM.exe                                     \
            pngfile_CTO_naktext                                \
                PAINT5D_DEFAULT_DATA_002.PNG                   \
                PAINT5D_DEFAULT_DATA_002_NAK._                 \
                PAINT5D_DEFAULT_DATA_002_NOE._ ##-------------##
        ##:----------------------------------------:[ASS_002]:##

        cd $original_directory

    #############################_GENERATE_HARDASS_PNG_ASSETS_##
    ##_GENERATE_GLSL_CODE_FROM_C99_CODE_########################

        ## @VID_IID[ 0114 ]TIME[ 03:07:50 ] ####################
        ## All this does is surround every single line of     ##
        ## the file in quote marks like this:                 ##
        ##      $INN LINE:  Some Line Of Code                 ##
        ##      $OUT LINE: "Some Line Of Code \n"             ##
        ##                                                    ##
        ## So we can automate process of creating GLSL        ##
        ## code from C99 code.                                ##
        ########################################################

        INN="./LIB/GPUVIEW.FRA._"
        OUT="./LIB/GPUVIEW.FRA.STRING._"
        awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

        INN="./LIB/P5D1OGL.FRA._"
        OUT="./LIB/P5D1OGL.FRA.STRING._"
        awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

    ########################_GENERATE_GLSL_CODE_FROM_C99_CODE_##
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