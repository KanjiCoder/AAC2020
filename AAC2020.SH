
    ## IF you are tired, here is some busy work:
    ## TURN ON[ -Wconversion ]
    ## And start fixing where things break. 

    ##:_CREATE_BUILD_SYSTEM_EXECUTABLES_:====================:##
        ##----------------------------------------------------##
        ## PNG_HEX_DUMPer Utility For Embedding PNG File Data ##
        ##----------------------------------------------------##

        bs1_src="./LIB/EXE/PHEXDUM.C11" ## FIlePath:INNput    ##
        bs1_exe="./LIB/EXE/PHEXDUM.exe" ## FIlePath:OUTput    ##

        bs2_src="./LIB/EXE/RENCORE.C11" ## FIlePath:INNput    ##
        bs2_exe="./LIB/EXE/RENCORE.exe" ## FIlePath:OUTput    ##

        ##----------------------------------------------------##
        gcc -x c                                               \
            -c $bs1_src                                        \
            -o  obj.___                                        \
            -std=c11                                           \
            -m64 ##- - - - - - - - - - - - - - - - - - - - - -##
            gcc -o $bs1_exe obj.___ 
            rm              obj.___
        ##----------------------------------------------------##
        gcc -x c                                               \
            -c $bs2_src                                        \
            -o obj.___                                         \
            -std=c11                                           \
            -m64 ##- - - - - - - - - - - - - - - - - - - - - -##
            gcc -o $bs2_exe obj.___ 
            rm              obj.___
        ##----------------------------------------------------##
    ##:====================:_CREATE_BUILD_SYSTEM_EXECUTABLES_:##
    ##_GENERATE_HARDASS_PNG_ASSETS_#############################

        original_directory=$PWD
        cd ./LIB/ASS

        ##:[ASS_001]:----------------------------------------:##
        ## MAKE(S): U32 PAINT5D_DEFAULT_DATA_001_NAK ###########
        ## MAKE(S): I32 PAINT5D_DEFAULT_DATA_001_NOE ###########
        ## FOR::::: U32 PAINT5D_DEFAULT_DATA_001_PNG ###########
        ../EXE/PHEXDUM.exe                                     \
            pngfile_CTO_naktext                                \
                PAINT5D_DEFAULT_DATA_001.PNG                   \
                PAINT5D_DEFAULT_DATA_001_NAK._                 \
                PAINT5D_DEFAULT_DATA_001_NOE._ ##-------------##
        ##:----------------------------------------:[ASS_001]:##
        ##:[ASS_002]:----------------------------------------:##
        ## MAKE(S): U32 PAINT5D_DEFAULT_DATA_002_NAK ###########
        ## MAKE(S): I32 PAINT5D_DEFAULT_DATA_002_NOE ###########
        ## FOR::::: U32 PAINT5D_DEFAULT_DATA_002_PNG ###########
        ../EXE/PHEXDUM.exe                                     \
            pngfile_CTO_naktext                                \
                PAINT5D_DEFAULT_DATA_002.PNG                   \
                PAINT5D_DEFAULT_DATA_002_NAK._                 \
                PAINT5D_DEFAULT_DATA_002_NOE._ ##-------------##
        ##:----------------------------------------:[ASS_002]:##
        ##:[ASS_003]:----------------------------------------:##
        ## MAKE(S): U32 UIRECTS_64P_08G_NAK ####################
        ## MAKE(S): I32 UIRECTS_64P_08G_NOE ####################
        ## FOR::::: U32 UIRECTS_64P_08G_PNG ####################
        ../EXE/PHEXDUM.exe                                     \
            pngfile_CTO_naktext                                \
                UIRECTS_64P_08G.PNG                            \
                UIRECTS_64P_08G_NAK._                          \
                UIRECTS_64P_08G_NOE._ ##----------------------##
        ##:----------------------------------------:[ASS_003]:##

        cd $original_directory

    #############################_GENERATE_HARDASS_PNG_ASSETS_##
    ##_INVOKE_RENDER_CORE_BUILD_SYSTEM_#########################

        ./LIB/EXE/RENCORE.exe LOAD

    #########################_INVOKE_RENDER_CORE_BUILD_SYSTEM_##
    ##_OPTIONAL_:DELETE_OLD_SHADERS_FROM_MOD_FOLDER:############

        rm "./MOD/SHADER_000_GPUVIEW.FRAG"
        rm "./MOD/SHADER_001_PAINT5D.FRAG"

    #############_OPTIONAL_:DELETE_OLD_SHADERS_FROM_MOD_FOLDER##
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
        ##:COMMON_MACROS:------------------------------------:##

            INN="./LIB/MAC/FRA/TOP._"
            OUT="./LIB/MAC/FRA/TOP.STR._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

            INN="./LIB/MAC/FRA/BOT._"
            OUT="./LIB/MAC/FRA/BOT.STR._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

            ##- - - - - - - - - - - ---- - - - - - - - - - - -##

            INN="./LIB/EDITOR_SHADER_MACROS.TOP._"
            OUT="./LIB/EDITOR_SHADER_MACROS.TOP.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

            INN="./LIB/EDITOR_SHADER_MACROS.BOT._"
            OUT="./LIB/EDITOR_SHADER_MACROS.BOT.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

        ##:------------------------------------:COMMON_MACROS:##
        ##:MAIN_MASS_SHADERS:--------------------------------:##

            INN="./LIB/FRAGCOM.FRA._"
            OUT="./LIB/FRAGCOM.FRA.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

            INN="./LIB/TAUFRAG.FRA._"
            OUT="./LIB/TAUFRAG.FRA.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

            INN="./LIB/GPUVIEW.FRA._"
            OUT="./LIB/GPUVIEW.FRA.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

            INN="./LIB/UISHARE.FRA._"
            OUT="./LIB/UISHARE.FRA.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

            INN="./LIB/UIFRAGS.PAINT5D.FRA._"
            OUT="./LIB/UIFRAGS.PAINT5D.FRA.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

            INN="./LIB/P5D1OGL.FRA._"
            OUT="./LIB/P5D1OGL.FRA.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

        ##:--------------------------------:MAIN_MASS_SHADERS:##
        ##:RENCORE_PRIVATE:----------------------------------:##

            ## :::::::::::::::::::::::::::::::::::::::::::::: ##
            ## These files should __NOT__ be copied by :::::: ##
            ## AAC2020_EXTCODE_******* writers.        :::::: ##
            ## (extension code writers)                :::::: ##
            ## :::::::::::::::::::::::::::::::::::::::::::::: ##

            INN="./LIB/RENCORE.TOP._"
            OUT="./LIB/RENCORE.TOP.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

            INN="./LIB/RENCORE.BOT._"
            OUT="./LIB/RENCORE.BOT.STRING._"
            awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT

        ##:----------------------------------:RENCORE_PRIVATE:##
        ##:RENCORE(S):---------------------------------------:##

            ## :::::::::::::::::::::::::::::::::::::::::::::: ##
            ## Allow for EXTENDING (compile time plugin) :::: ##
            ## the AAC2020 code base. For example, see  ::::: ##
            ## PROJECT[ AAC2020_EXTCODE_MANDELA ] ::::::::::: ##
            ## :::::::::::::::::::::::::::::::::::::::::::::: ##

        ##  INN="./LIB/RENCORE/PAINT5D.RENCORE._"
        ##  OUT="./LIB/RENCORE/PAINT5D.RENCORE.STRING._"
        ##  awk 'NF { print "\""$0"\\""n""\""}' $INN > $OUT


            I="./LIB/RENCORE/PAINT5D/tilodat_CTO_tilpixu._"
            O="./LIB/RENCORE/PAINT5D/tilodat_CTO_tilpixu.STR._"
            awk 'NF { print "\""$0"\\""n""\""}' $I > $O

            I="./LIB/RENCORE/PAINT5D/tilpixa_CTO_laypixu._"
            O="./LIB/RENCORE/PAINT5D/tilpixa_CTO_laypixu.STR._"
            awk 'NF { print "\""$0"\\""n""\""}' $I > $O

            I="./LIB/RENCORE/PAINT5D/laypixa_CTO_plypix3._"
            O="./LIB/RENCORE/PAINT5D/laypixa_CTO_plypix3.STR._"
            awk 'NF { print "\""$0"\\""n""\""}' $I > $O

        ##:---------------------------------------:RENCORE(S):##

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
    ############################################################
    ##_LEAVE_NO_TRACE_##########################################

        ## +-------------------------------------------------+
        ## |Remove traces of RENCORE extension code(EXTCODE) |
        ## +----------------------------------+--------------+
        ##                                    |
        ./LIB/EXE/RENCORE.exe UNDO ## <-------+

    ##########################################_LEAVE_NO_TRACE_##
    ############################################################
    ## Run and then remove the engine executable.           ####
    ##------------------------------====--------------------####

        ##001: CALL_EXE:

             ./EXE.exe                 

        ##002: GET_EXIT_STATUS:

            exit_status_of_exe=$?
            echo "[EXE.exe:exit_status_of_exe]"
            echo $exit_status_of_exe

        ##003: REMOVE_THE_EXE:

            rm     EXE.exe                  
                                                                  
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