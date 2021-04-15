# AAC2020 : Atomic Alice C11 2020

## INDEX:
### 1: ABOUT
### 2: DEVELOPER_TIME_COSTS
### 3: CONCEPTUAL_TYPES
### 4: DIAGRAMS
### 5: VARIABLE_NAME_INDEX
### 6: FUNCTION_NAME_INDEX
### 7: ITS_WRONG
### 8: LIBCHAN_AND_LIBCHAN_DIAGRAM

    //:ABOUT:================================================://

        //:SUMMARY:------------------------------------------://

            Fractal auto tiling engine.

        //:------------------------------------------:SUMMARY://
        //:ENGINE_FEATURES:----------------------------------://

            Main Engine Features:
            
            1. Each auto tile design contains
               different LAYERS and TILE SIZES.
               (PAINT5D Sub System Does This Part)

            2. Each AUSET (auto tile set)
               has only 4 graphics and the
               16 sub-tiles needed for proper
               WANG auto tiles is generated
               from those 4 graphics.
               (SUBSYSTEM_DOES_NOT_EXIST_YET)

            3. Auto Tiling Of Tiles within a rendered
               LEVEL MAP.
               (SUBSYSTEM_DOES_NOT_EXIST_YET)

            4. Tiles are drawn using
               other TILES instead of pixels
               creating FRACTAL AUTO TILES
               (SUBSYSTEM_DOES_NOT_EXIST_YET)

        //:----------------------------------:ENGINE_FEATURES://
        //:WARNING:------------------------------------------://

            I am __VERY__ oppinionated about how to write code.
            My code gets more insane as the years go by.
            But I have reasons for why I do what I do.

            If you find my opinions offensive, just remember
            that I kinda sound like Micky Mouse. And if
            Micky Mouse was trash talking me I'd just
            laugh my ass off.

        //:------------------------------------------:WARNING://
        //:INNER_WORKINGS:-----------------------------------://

            1. Zero external dependencies.
            2. Zero headers, loads DLLs at runtime.
            3. Zero references to <windows.h>

                Uses assembly code to get access to
                LoadLibrary and GetProcAddress and then
                grabs all of the win32 and openGL
                function pointers from there.
        
        //:-----------------------------------:INNER_WORKINGS://
        //:LIBCHAN:------------------------------------------://

            This project uses a concept called a 
            "library chain" (LIBCHAN). All sub library code is 
            included into the project in an EXACT order. Each 
            library being assigned a different library chain 
            index. You can compile up to ANY index and get a 
            working executable file. The idea behind this is 
            to allow a way to quickly binary search through
            the code base if ever some type of hard to pin down
            undefined behavior is introduced into the project.

        //:------------------------------------------:LIBCHAN://
        //:GOALS:--------------------------------------------://

            //:goal_01:single_payload:- - - - - - - - - - - -://

                The goal of this project is a single payload
                of 1 executable file when finished. 
                No installer. If you want to share a build,
                you only need to pass around the 
                resulting .exe.

            //:- - - - - - - - - - - -:goal_01:single_payload://
            //:goal_02:data__leverage:- - - - - - - - - - - -://

                As an engine for INDIE teams, we need to
                leverage our bits. Get the most bang for
                our buck with the least number of bits.
                This isn't just about performance, it is
                about asset creation time.

                Modern auto tiling engines involve a lot
                of redundancy with their graphics, so much
                that there are often automated tools to
                help generate auto tile sets.

                This is a waste in 2 ways:

                1. Waste of artist time.
                2. Waste of engine memory.

                To best leverage our data so the artists can
                achieve the most work per human brain hour,
                all auto tiles are stored as 4 tile graphics.
                Top left, top right, bottom left, bottom 
                right. The engine will use this data to
                extrapolate a 16 tile auto tile set.

                Auto tile sets are refered to as 
                "ausets" in this code base. "Subtiles" are
                the individual graphics that make up a
                single "auset".

            //:- - - - - - - - - - - -:goal_02:data__leverage://
            //:goal_03:rigid_not_flexible:- - - - - - - - - -://

                This code base chooses to treat code as a 
                "House" rather than some type of amorphous
                half baked ideolistic thing that can be
                endlessly molded and refactored to your
                desires.

                Being able to understand and find our way
                around the code is a very high priority.
                And we will try and write our code in
                a very NON-abstract and RIGID way.

                The loss of flexibility is worth the
                gains in comprehension.

                I also believe that code is read many more
                times than it is written, so code shall
                NEVER be written in a style that saves
                me time as a developer.

            //:- - - - - - - - - -:goal_03:rigid_not_flexible://
            //:goal_04:mental_torque__turtle_coding:- - - - -://

                The goal is a slow and steady pace of 
                development. Development will always be 
                slow. But the code will be solid.
                Sometimes sub librarys will be composed of
                over 50% unit testing code.

                NOTE: I do not believe in "TDD"
                      (Test Driven Development)

                The code base is written using "DOD".
                (Data Oriented Design). As Mike Acton would
                say "Different Data Different Problem."

                Code will be written starting at whatever
                point is mentally clearest to the human.
                Sometimes that will mean a TDD style of
                interface & tests first. Other times that
                will mean doing the exact oppisite and 
                starting from the low level details.

                Start writing code from wherever your
                vision of the code is the clearest.
                Arbitrarily doing the "interface" or
                "low level details" first is a mindless
                strategy that could be hindering you
                half of the time.

            //:- - - - -:goal_04:mental_torque__turtle_coding://
            //:goal_05:flat_project:- - - - - - - - - - - - -://

                We will keep the project structure as
                flat as possible. The last thing I want
                to see is more than one obvious choice
                as to where a source file should go.

                A branching project structure can be nice
                for exploring a project and looking for things,
                but other than that I think it's a stupid
                idea.

                Since branching folders is nice for FINDING
                things, we have a folder called "DOC/FPT"
                where you can setup a tree structure.
                FPT stands for "Fake Project Tree".

                This solves the problem of finding things
                without creating refactoring problems and
                organization headaches.

                Example:
                    LIB/PAINT5D.D._
                    LIB/PAINT5D.F._
                
                    Is stored in a massive flat LIB folder.

                    But you might also be able to find it as:

                    DOC/FPT/EDITORS/PAINT5D.txt
                    DOC/FPT/SOME/OTHER/CATEGORY/PAINT5D.txt

                    There! You can have "PAINT5D" wherever
                    it organizationally makes sense, even
                    if it is more than one place!

            //:- - - - - - - - - - - - -:goal_05:flat_project://
            //:goal_06:coarse_grain:- - - - - - - - - - - - -://

                Avoid splitting files into multiple smaller
                files only in the name of manigability.

                Every sub system should be composed of
                exactly 2 files. A data file and a function
                file. 

                It doesn't matter if there is 1000s of lines
                of code in the file, don't split it up.

                    (  There are exceptions to the rule.   )    
                    (  But code length is NOT one of them. )    
                    (  For example: P5D_OGL._ is code that )
                    (  logically belongs in PAINT5D.F._    )
                    (  but since it is written to be       )
                    (  ran as both C99 & GLSL , putting    )
                    (  it into it's own file makes it      )
                    (  easier to cut+paste it into         )
                    (  GLSL shaders.                       )
                
                Ideally only ONE PERSON should be touching
                any sub-system at a time. Splitting a
                sub-system into multiple files just
                increases administrative effort and makes
                it easier for multiple people to be 
                editing the same system at the same time.

                My experience working on projects with
                other people leads me to believe that
                any more than one person working in a 
                specific domain will lead to negative
                work being done as people step all over
                each other's proverbial toes.

            //:- - - - - - - - - - - - -:goal_06:coarse_grain://
            //:goal_07:looks_matter:- - - - - - - - - - - - -://

                Looks matter. By meticulously lining up
                code we can use our "fast thinking"
                part of the brain to "mentally lint"
                code quickly with minimal human brain cycles.

                I want code that is so meticulously lined
                up and organized that people who know nothing
                about the code can spot an error because
                the code just "looks wrong".

                No matter how many tests we right, the
                halting problem proves we can never
                gaurantee the correctness of a programming.
    
                So by lining stuff up meticulously, we
                have one more line of defense in the
                battle to create correct code.

            //:- - - - - - - - - - - - -:goal_07:looks_matter://
            //:goal_08:simple_tools:- - - - - - - - - - - - -://

                Someone who knows nothing about C code should
                be able to build this project by just
                clicking the build script.
            
                A slightly experienced person should be
                able to build by feeding AAC2020.C11
                into GCC. No linker or dependency
                configuration required.

                Code should be so consistent that we don't 
                need a fancy IDE or code ananlysis tools
                to find our way around.

                My preferred kitchen tool is a pocket knife,
                not a blender.

            //:- - - - - - - - - - - - -:goal_08:simple_tools://

        //:--------------------------------------------:GOALS://
        //:MISC:---------------------------------------------://

            1. spaces , not tabs. No Auto Formatting.

                Maybe I did too much art school. But I
                format and align code on a case by case
                basis, there is no way tabs are going to
                fly here. People say I am being authoritarian
                and imposing my viewing preferences on
                other people by using spaces... Well...
                Hey... I have a hard time with your 120
                column limit code when I use a vertical
                monitor and like to keep things to a
                hard limit of 64 characters.
    
            2. Hard column limit of 64 characters.

                The only exception is TODO notes.
                Because TODO notes are allowed to be annoying
                and abnoxious. Hence the idiom
                "the squeeky wheel gets the grease".

            3. No forward declarations.

                Exception: Unit tests because they get
                so large it is nice to keep them in
                the bottom of the file.

                By avoiding forward declarations we can  
                have a gaurantee of where to find
                the function definition. It is always
                ABOVE the call site in the source.

            4. Unit tests in the SAME FILE as code being tested.

                To help prevent rot of test code, we are
                NOT going to keep a seperate test project
                or test folder. Test code should be so
                engrained into the system that it is a
                herculean effort to REMOVE IT.

                At some point we may want to make that
                herculean effort to seperate our concerns.
                But until we have a substantial and successful
                project we should make it as difficult to
                de-activate or remove test code as possible.

                But even then I doubt it. Having the test
                code in the same file as the file being
                tested makes it really easy to CTRL+F
                though the code when it fails and find
                problems.

            5. No header files.

                A header file is basically a big chunk
                of forward declarations. They are not 
                allowed. If you want a summary of
                functions in a file, you can create a
                NOTES ( sub_system_name.N._ ) file for that.

            6. This is how I write code.
               
                Sure, there are some disasters in the code
                base. But this README.MD file has been
                formatted using my typical coding style.

        //:---------------------------------------------:MISC://

    //:================================================:ABOUT://
    //:DEVELOPER_TIME_COSTS:---------------------------------://
    |||| TASK ____________________________|| ESTIMATED_TIME   ||
                                          ||                  ||
        1. Stubbing in a new sub-system:  || 00:30 -to- 02:00 ||
                                          ||                  ||
    |||| TASK ____________________________|| ESTIMATED_TIME   ||
    //:---------------------------------:DEVELOPER_TIME_COSTS://
    //:CONCEPTUAL_TYPES:=====================================://

        painpix :-------------------------------------------:
        01 : til_qua :( t_q ): [ 0 -to- 3                   ]
        02 : til_exp :( t_e ): [ 0 -to- 7                   ]
        03 : til_lay :( t_l ): [ 0 -to- 2                   ]
        04 : loc_t_x :( t_x ): [ 0 -to- til_exp_CTO_max_cor ]
        05 : loc_t_y :( t_y ): [ 0 -to- til_exp_CTO_max_cor ]
    
        glocpix :-------------------------------:
        01 : glo_t_x :( g_x ): [ 0 -to- (512-1) ]
        02 : glo_t_y :( g_y ): [ 0 -to- (512-1) ]

        cuvipix :-------------------------------:
        01 : cuv_i_x :( i_x ): [ 0 -to- (256-1) ]
        02 : cuv_i_y :( i_y ): [ 0 -to- (256-1) ]

    //:=====================================:CONCEPTUAL_TYPES://
    //:DIAGRAMS:=============================================://
    //:DIAGRAMS:PAINT5D_MENTAL_MODELS:|||||||||||||||||||||||://

    [ EDI_001 / PAINT5D ] : DATA_LAYOUT 
    UNITS_IN_DIAGRAM_BELOW_ARE[ PIXELS ]

    |<--------------------- 512 --------------------->|
    |<---------256--------->| |<---------256--------->|
    |<-- 128 -->|                                     |
    +--=--+--=--+--=--+--=--+ +--=--+--=--+--=--+--=--+ ---+---
    |           |           | |           |           |    |
    | @til_lay  | @til_lay  | |           |           |    0
    +     0     +     1     + +           +           +@til_exp
    |     @til_qua === 0    | |     @til_qua === 1    |    0
    |           |           | |           |           |    |
    +--=--+--=--+--=--+--=--+ +--=--+--=--+--=--+--=--+ ---+---
    |           |  0  |  1  | |           |     |     |@til_exp
    | @til_lay  |     |     | |           |     |     |    1
    +     2     +-----+--+--+ +           +-----+--+--+ ---+---
    |           |  2  |__|__| |           |     |__|__| <- 2
    |           |     |__|..| |           |     |__|..| 
    +--=--+--=--+--=--+--=--+ +--=--+--=--+--=--+--=--+
    +--=--+--=--+--=--+--=--+ +--=--+--=--+--=--+--=--+ -------
    |           |           | |           |           |    |
    |           |           | |           |           |    |
    +           +           + +           +           +    |
    |     @til_qua === 2    | |     @til_qua === 3    |    |
    |           |           | |           |           |    3
    +--=--+--=--+--=--+--=--+ +--=--+--=--+--=--+--=--+@til_qua
    |           |     |     | |           |     |     |    3
    |           |     |     | |           |     |     |    |
    +           +-----+--+--+ +           +-----+--+--+    |
    |           |     |__|__| |           |     |__|__|    |
    |           |     |__|..| |           |     |__|..|    |
    +--=--+--=--+--=--+--=--+ +--=--+--=--+--=--+--=--+ -------

    [ EDI_001 / PAINT5D ] : #CANVAS_USER_VIEW# :
    UNITS_IN_DIAGRAM_BELOW_ARE[ PEBBLES ]
                 
    @-----------------------+ @-----------------------+ -------
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |   TOP_LEF: SUB_TILE   | |  TOP_RIG: SUB_TILE    |    |
    |  #TOP_LEF__SUB_TILE#  | | #TOP_RIG__SUB_TILE#   |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    +-----------------------+ +-----------------------+   256
    +-----------------------+ +-----------------------+    |
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |   BOT_LEF: SUB_TILE   | |  BOT_RIG: SUB_TILE    |    |
    |  #BOT_LEF__SUB_TILE#  | | #BOT_RIG__SUB_TILE#   |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    |                       | |                       |    |
    +-----------------------+ +-----------------------+ -------
    |<-------- 128 -------->|                         |
    |<--------------------- 256 --------------------->|

    Help Understanding Test Code: 
    aac2020_P5D1OGL_UTC_painpix_CTO_cuvipix( ... )
    TEST_SECTION[ #BOTTOM_LEFT_ALL_TILE_EXPONENTS# ]

    When converting from painpix to cuvipix , we loose
    information because large tiles cover multiple
    pebble-sized tiles on the #CANVAS_USER_VIEW# diagram.
    The location of any tile in terms of canvas user view
    pebble units will be the top-left-most pebble the tile
    is overlayed over. For example, the largest tile put
    in the top-left quadrant of canvas user view will have
    a coordinate of [0,0]. Where as if it were in the
    bottom right quadrant, it's coordinate would be
    [128,128].
                                       .
                                       .
                                       .
                                   +---+ til_exp == 0 
                                   | X | SUBTRACT( 0 )
                                ...+---+ FORMULA[ (2^0)-1 ]

                                       |
                               +---+---+
                               | X |   |
                               +---+---+ til_exp == 1
                               |   |   | SUBTRACT( 1 )
                            ...+---+---+ FORMULA[ (2^1)-1 ]
                    
                                       |
                       +---+---+---+---+
                       | X |   |   |   |
                       +---+---+---+---+
                       |   |   |   |   |
                       +---+---+---+---+
                       |   |   |   |   |
                       +---+---+---+---+ til_exp == 2
                       |   |   |   |   | SUBTRACT( 3 )
                    ...+---+---+---+---+ FORMULA[ (2^2)-1 ]

                                       |
       +---+---+---+---+---+---+---+---+
       | X |   |   |   |   |   |   |   |
       +---+---+---+---+---+---+---+---+
       |   |   |   |   |   |   |   |   |
       +---+---+---+---+---+---+---+---+
       |   |   |   |   |   |   |   |   |
       +---+---+---+---+---+---+---+---+
       |   |   |   |   |   |   |   |   |
       +---+---+---+---+---+---+---+---+
       |   |   |   |   |   |   |   |   |
       +---+---+---+---+---+---+---+---+
       |   |   |   |   |   |   |   |   |
       +---+---+---+---+---+---+---+---+
       |   |   |   |   |   |   |   |   |
       +---+---+---+---+---+---+---+---+ til_exp == 2
       |   |   |   |   |   |   |   |   | SUBTRACT( 7 )
    ...+---+---+---+---+---+---+---+---+ FORMULA[ (2^3)-1 ]
 
    //:|||||||||||||||||||||||:DIAGRAMS:PAINT5D_MENTAL_MODELS://
    //:DIAGRAMS:P5D1OGL_AKA_PAINT5D_GLSL_CODE:|||||||||||||||://

    |<-CUV->|        |<-PIX->|
    +---+---+        +---+---+          CUV: Canvas_User_View
    |T_L|T_R|        |       |
    +---+---+ <====> +  DAT  +          DAT: AAC2020_PIXNAME_
    |B_L|B_R|        |       |          .....paint5d_cpu_pix
    +---+---+        +---+---+
    |<-256->|        |<-512->|


        [000,000]    [128,000]
            |            |
            +---+        +---+  <-----+
            |T_L|        |T_R|        |
            +---+        +---+        +---+---+
                                      |T_L|T_R|
        [000,128]    [128,128]        +---+---+ EXPLODED_VIEW
            |            |            |B_L|B_R| ON_THE_LEFT
            +---+        +---+        +---+---+ DESCRIBING
            |B_L|        |B_R|        |       #_PEBBLE_ORIGINS_#
            +---+        +---+  <-----+

    ------------------------------------------------------------
    @VID_IID[ 0106 ]TIME[ 03:59:42 ]BEGIN_EXPLANTION
    @VID_IID[ 0106 ]TIME[ 04:02:16 ]END__EXPLANATION
    @VID_IID[ 0106 ]TIME[ 04:04:00 ]MORE_EXPLANATION
    
    #_DIA_P5D_PIXEL_CAKE_SLICES_#
    
    #_THE_PIXEL_PAYLOAD_FOR_TILE_SIZES_IS_NOT_THIS_#
    
    |<----R----->|<-----G----->|<-----B----->|<-----A----->|
    15 14 13 12   11 10 09 08   07 06 05 04   03 02 01 00 |
    00 00 00 00 | 00 00 00 00 | 00 00 00 00 | 00 00 00 00 |
    || || ||                          ||
    || || ||                          ++---------------+
    || || ++----------------------+                    |
    || ||                         |                    |
    || ++----------------------+  |                    |
    ||                         |  |                    |
    ++----------------------+  |  |                    |
    |                       |  V  V                    V
    V                       V  V  V                    V
    +--=--+--=--+--=--+--=--+  V  V                    V
    |           |           |--+  V    11              V
    | @til_lay  | @til_lay  |  |--+   /   10           V
    +     0     +     1     +  |  |--+   /   09        V
    |     @til_qua === 0    |  |  |  |--+   /   08     V
    |           |           |  |  |  |  |--+   /   07  V
    +--=--+--=--+--=--+--=--+  |  |  |  |  |--+   /    V
    |           |  0  |  1  |  |  |  |  |  |  |--+     V
    | @til_lay  |     |     |  |  |  |  |  |  |  |--+  V
    +     2     +-----+--+--+  |  |  |  |  |  |  |  |--+
    |           |  2  |__|__|  |  |  |  |  |  |  |  |  |..+
    |           |     |__|..|  |  |  |  |  |  |  |  |  |  .
    +--=--+--=--+--=--+--=--+  |  |  |  |  |  |  |  |  |  .
       |                       |  |  |  |  |  |  |  |  |  .
       +--=--+--=--+--=--+--=--+  |  |  |  |  |  |  |  |  .
          |                       |  |  |  |  |  |  |  |  .
          +--=--+--=--+--=--+--=--+  |  |  |  |  |  |  |  .
             |                       |  |  |  |  |  |  |  .
             +--=--+--=--+--=--+--=--+  |  |  |  |  |  |  .
                |                       |  |  |  |  |  |  .
                +--=--+--=--+--=--+--=--+  |  |  .  |  |  .
                   |                       |  |  .  .  |  .
                   +--=--+--=--+--=--+--=--+  |  .  .  .  .
                      |                       |  .  .  .  .
                      +--=--+--=--+--=--+--=--+  .  .  .  .
                        .                        .  .  .  .
                        ...................................
    
    //:|||||||||||||||:DIAGRAMS:P5D1OGL_AKA_PAINT5D_GLSL_CODE://
    //:DIAGRAMS:LEVEL16_AKA_METROID_VANIA_16:||||||||||||||||://

                123_123
    LONG__NAME: LEVEL16  (16 levels packed into memory system)
    SHORT_NAME:     L16

    |<------------ 512 ------------>|   
    |<---- 256 ---->|               |
    |<-128->|       |               |
    +==---==+==---==+==---==+==---==+   +==---==+
    |  |||  |  |||  |  |||  |  |||  |   |  |||  | <-- ONE_LEVEL
    |  128  |  128  |  128  |  128  |   |  128  |     USES__128
    |  |||  |  |||  |  |||  |  |||  |   |  |||  |     BY____128
    +==---==+==---==+==---==+==---==+   +==---==+     PIXELS___
    |  |||  |  |||  |  |||  |  |||  |   |        \
    |  128  |  128  |  128  |  128  |   |          \
    |  |||  |  |||  |  |||  |  |||  |   |            \
    +==---==+==---==+==---==+==---==+   +==--==+==--==+ --=--
    |  |||  |  |||  |  |||  |  |||  |   |  ||  |  ||  |   |
    |  128  |  128  |  128  |  128  |   |  64  |  64  |   |
    |  |||  |  |||  |  |||  |  |||  |   |  ||  |  ||  |   |
    +==---==+==---==+==---==+==---==+   +==--==+==--==+  128
    |  |||  |  |||  |  |||  |  |||  |   |  ||  |  ||  |   |
    |  128  |  128  |  128  |  128  |   |  64  |  64  |   |
    |  |||  |  |||  |  |||  |  |||  |   |  ||  |  ||  |   |
    +==---==+==---==+==---==+==---==+   +==--==+==--==+ --=--
    .                               .   .    VV|VV    .
    ^                               ^   .    VV|VV    .
    |  16 level maps loaded into a  |   .    VV|VV    .
    |  512x512 texture.             |   .    VV|VV    .
    +-------------------------------+   .    VV|VV    .
    +-------------------+               .    VV|VV    .
    |  BITS[ R + G ] :  |               .    VV|VV    .
    |  +==--==+==--==+ <<<<<<<<<<<<<<<< +==--==+==--==+
    |  | GEOM+BOMBS: |  |               |  ||  |  ||  |
    |  | R 1111 0000 |  .   PARALLAX  -->  64  |  64  <--STATIC
    |  | R 0000 1111 |  .  (ScrollingBG)|  ||  |  ||  |      BG
    |  +             +  .               +==--==+==--==+
    |  | SPRITE+LIGHT|  .               |  ||  |  ||  |
    |  | G 1111 0000 |  .  GAME_TILES -->  64  |  64  <--STATIC
    |  | G 0000 1111 |  |  (ForeGround) |  ||  |  ||  |      FG
    |  +==--==+==--==+ <<<<<<<<<<<<<<<< +==--==+==--==+
    |                   |
    |  BITS[ B + A ] :  +------------+-------------------------+
    |  +==----==+==----==+==----==+  .  TINY SUB TILE DETAILS  |
    |  |        |        |        |  .  created by taking      |
    |  |   _1   |   _1   |   _1   |  .  remaining 16 BLUE &    |
    |  |        |        |        |  .  ALPHA bits and         |
    |  +==----==+==----==+==----==+  .  spatially laying them  |
    |  |        |  1111  |        |  .  out in the manner      |
    |  |   _1   |        |   _1   |  .  depicted to my LEFT.   |
    |  |        |  1111  |        |  .                         |
    |  +==----==+==----==+==----==+  .  B 1111 1111            |
    |  |        |        |        |  .  A 1111 1111            |
    |  |   _1   |   _1   |   _1   |  .                         |
    |  |        |        |        |  .                         |
    |  +==----==+==----==+==----==+  +-------------------------+
    |                                |
    |  Surrounding Cells Get 1 bit   |
    |  for "set" or "unset" value.   |
    |  (Tile exists or is empty space)
    |                                |
    |  1111 bits in middle for       |
    |  material type used for ALL    |
    |  3x3( 9 )  sub section tile    |
    |  material types.               |
    |                                |
    |   111 bits for:                |
    |   001: Is level 1 SubDiv on?   |
    |   010: Is level 2 SubDiv on?   |
    |   100: Is level 3 SubDiv on?   |
    |                                |
    |   1 bit for:                   |
    |      Does CENTER tile exist?   |
    |                                |
    +--------------------------------+
    
    Sub Division Levels: [ 1 & 2 & 3 ]:
    +- - - - - - - - -+- - - - - - - - -+- - - - - - - - -+
    |  +-----------+  |  +-----------+  |  +-----------+  |
    .  |           |  .  | +-------+ |  .  | +-------+ |  .
    |  |           |  |  | |       | |  |  | | +---+ | |  |
    .  |     1     |  .  | |   2   | |  .  | | | 3 | | |  .
    |  |           |  |  | |       | |  |  | | +---+ | |  |
    .  |           |  .  | +-------+ |  .  | +-------+ |  .
    |  +-----------+  |  +-----------+  |  +-----------+  |
    +- - - - - - - - -+- - - - - - - - -+- - - - - - - - -+

    When drawing at smallest sub division level, the tiles
    take up [1/3/3/3] of a full tile. The auto tileing then
    connects the set tiles.

    Say all tiles are set of the smallest sub-division level:
    +- - - - - - - - -+- - - - - - - - -+- - - - - - - - -+
    |                 |                 |                 |
    .                 .                 .                 .     
    |      +---+      |      +---+      |      +---+      |     
    .      | 3 |      .      | 3 |      .      | 3 |      .     
    |      +---+      |      +---+      |      +---+      |     
    .                 .                 .                 .     
    |                 |                 |                 |     
    +- - - - - - - - -+- - - - - - - - -+- - - - - - - - -+  
    |                 |                 |                 |
    .                 .                 .                 . 
    |      +---+      |      +---+      |      +---+      | 
    .      | 3 |      .      | 3 |      .      | 3 |      . 
    |      +---+      |      +---+      |      +---+      | 
    .                 .                 .                 . 
    |                 |                 |                 |
    +- - - - - - - - -+- - - - - - - - -+- - - - - - - - -+
    |                 |                 |                 |
    .                 .                 .                 .
    |      +---+      |      +---+      |      +---+      |
    .      | 3 |      .      | 3 |      .      | 3 |      .
    |      +---+      |      +---+      |      +---+      |
    .                 .                 .                 .
    |                 |                 |                 |
    +- - - - - - - - -+- - - - - - - - -+- - - - - - - - -+

    Connect them procedurally like so:
    +- - - - - - - - -+- - - - - - - - -+- - - - - - - - -+
    |                 |                 |                 |
    .                 .                 .                 .     
    |      +---+-------------+---+-------------+---+      |     
    .      | 3 |             | 3 |             | 3 |      .     
    |      +---+-------------+---+-------------+---+      |     
    .      |   |      .      |   |      .      |   |      .     
    |      |   |      |      |   |      |      |   |      |     
    +- - - |   | - - -+- - - |   | - - -+- - - |   | - - -+  
    |      |   |      |      |   |      |      |   |      |
    .      |   |      .      |   |      .      |   |      . 
    |      +---+-------------+---+-------------+---+      | 
    .      | 3 |             | 3 |             | 3 |      . 
    |      +---+-------------+---+-------------+---+      | 
    .      |   |      .      |   |      .      |   |      . 
    |      |   |      |      |   |      |      |   |      |
    +- - - |   | - - -+- - - |   | - - -+- - - |   | - - -+
    |      |   |      |      |   |      |      |   |      |
    .      |   |      .      |   |      .      |   |      .
    |      +---+-------------+---+-------------+---+      |
    .      | 3 |             | 3 |             | 3 |      .
    |      +---+-------------+---+-------------+---+      |
    .                 .                 .                 .
    |                 |                 |                 |
    +- - - - - - - - -+- - - - - - - - -+- - - - - - - - -+
    This method is ALL OR NOTHING however. A certain
    sub-tile size is either ALL_ONN or ALL_OFF for a given
    level tile we are adding sub divisions to.


    Lets try to get accurate idea of the proportions to
    understand the level of fine detail this allows.
    +===========+---+-=-+---+===========+ +===========+........
    ||          |     |     |          || ||          |........
    ||          +           +          || ||          +........
    ||          | --  2  -- |          || ||          |........
    ||          +           +          || ||          +........
    ||          |     |     |          || ||          |........
    +---+-=-+---+---+---+---+---+-=-+---+ +---+-=-+---+........
    |     |     |   |   |   |     |     | |     |     |........
    +           +---+---+---+           + +           +........
    | --  2  -- |   | 3 |   | --  2  -- | | --  2  -- |........
    +           +---+---+---+           + +           +........
    |     |     |   |   |   |     |     | |     |     |........
    +---+-=-+---+---+---+---+---+-=-+---+ +---+-=-+---+........
    ||          |     |     |          || ||          |........
    ||          +           +          || ||          +........
    ||          | --  2  -- |          || ||          |........
    ||          +           +          || ||          +........
    ||          |     |     |          || ||          |........
    +===========+---+-=-+---+===========+ +===========+........
    +===========+---+-=-+---+===========+ +===========+........
    ||          |     |     |          || ||          |........
    ||          +           +          || ||          +........
    ||          | --  2  -- |          || ||          |........
    ||          +           +          || ||          +........
    ||          |     |     |          || ||          |........
    +---+-=-+---+---+---+---+---+-=-+---+ +---+-=-+---+........
    |     |     |   |   |   |     |     | |     |     |........
    +           +---+---+---+           + +           +........
    | --  2  -- |   | 3 |   | --  2  -- | | --  2  -- |........
    +           +---+---+---+           + +           +........
    |     |     |   |   |   |     |     | |     |     |........
    +---+-=-+---+---+---+---+---+-=-+---+ +---+-=-+---+........
    ||          |     |     |          || ||          |........
    ||          +           +          || ||          +........
    ||          | --  2  -- |          || ||          |........
    ||          +           +          || ||          +........
    ||          |     |     |          || ||          |........
    +===========+---+-=-+---+===========+ +===========+........
    +===========+---+-=-+---+===========+ +===========+........
    ||          |     |     |          || ||          |........
    ||          +           +          || ||          +........
    ||          | --  2  -- |          || ||          |........
    ||          +           +          || ||          +........
    ||          |     |     |          || ||          |........
    +---+-=-+---+---+---+---+---+-=-+---+ +---+-=-+---+........
    |     |     |   |   |   |     |     | |     |     |........
    +           +---+---+---+           + +           +........
    | --  2  -- |   | 3 |   | --  2  -- | | --  2  -- |........
    +           +---+---+---+           + +           +........
    |     |     |   |   |   |     |     | |     |     |........
    +---+-=-+---+---+---+---+---+-=-+---+ +---+-=-+---+........
    ||          |     |     |          || ||          |........
    ||          +           +          || ||          +........
    ||          | --  2  -- |          || ||          |........
    ||          +           +          || ||          +........
    ||          |     |     |          || ||          |........
    +===========+---+-=-+---+===========+ +===========+........

                                   +==----==+==----==+==----==+
                    +---+          |        |        |        |
                    | 3 | --------->   _1   |   _1   |   _1   |
                    +---+      +--->   ^^   |        |        |
                              /    +==-||-==+==----==+==----==+
                             /     |   ||   |  1111  |        |
                +---+-=-+---+      |   ||   |        |   _1   |
                |     |     |      |   ||   |  1111  |        |
                +           +      +==-||-==+==----==+==----==+
                | --  2  -- |      |   ||   |        |        |
                +           +      |   ||   |   _1   |   _1   |
                |     |     |      |   ||   |        |        |
                +---+-=-+---+      +==-||-==+==----==+==----==+
                                       ||
                                       ||
    +===========+---+-=-+---+===========+  1 ==> 1/3  
    ||                .                ||  
    ||                .                ||  2 ==> 1/3/3  
    ||                .                ||
    ||                .                ||  3 ==> 1/3/3/3
    ||                .                ||
    ||                .                ||  Relative tile sizes
    ||                .                ||  used in subdivision
    ||                .                ||  grid.
    ||                1                ||
    ||                .                ||
    ||                .                ||
    ||                .                ||
    ||                .                ||
    ||                .                ||
    ||                .                ||
    ||                .                ||
    ||                .                ||
    +===========+---+-=-+---+===========+

    A bomb blast erases all of the bits on the
    [BLUE+ALPHA] channels. Since a bomb blast
    snaps to one tile size. Bomb blasts always whipe out
    NONE-or-ALL of the micro details on a tile.

    T_L : Top Lef Room # 1 #
    TOP : TOP Mid Room # 2 #
    T_R : Top Rig Room # 3 #

    LEF : LEF Mid Room # 4 #
    CEN : CEN Mid Room # 5 # AKA:[ YOU / CEN ]
    RIG : RIG Mid Room # 6 #

    B_L : Bot Lef Room # 7 #
    BOT : BOT Mid Room # 8 #
    B_R : Bot Rig Room # 9 #

    000 : Un-allocated. Not sure what to use for yet.

    |<------------ 512 ------------>|
    |<---- 256 ---->|               |
    |<-128->|       |               |
    +==---==+==---==+==---==+==---==+
    |  |||  |  |||  |  |||  |  |||  |
    |  T_L  |  TOP  |  T_R  |  HOR  |
    |  |||  |  |||  |  |||  |  |||  |
    +==---==+==---==+==---==+==---==+
    |  |||  |  |||  |  |||  |  |||  |
    |  LEF  |  YOU  |  RIG  |  000  |
    |  |||  |  |||  |  |||  |  |||  |
    +==---==+==---==+==---==+==---==+
    |  |||  |  |||  |  |||  |  |||  |
    |  B_L  |  BOT  |  B_R  |  000  |
    |  |||  |  |||  |  |||  |  |||  |
    +==---==+==---==+==---==+==---==+
    |  |||  |  |||  |  |||  |  |||  |
    |  VER  |  000  |  000  |  000  |
    |  |||  |  |||  |  |||  |  |||  |
    +==---==+==---==+==---==+==---==+
                        ^^
                        ||
    THE_DATA_LAYOUT ====++  (Actual layout of GPU data)
    THE_USER_LAYOUT ====++  (Visual Configuration In Game)
                        ||
                        VV
    User_Map_View (Like Canvas_User_View in PAINT5D)
    +-------+- - - -+-------+- - - -+-------+
    |       |       |       |       |       |
    |  T_L  |--hor--|  TOP  |--hor--|  T_R  |
    |       |       |       |       |       |
    +-------+- - - -+-------+- - - -+-------+
    |   |   |       |   |   |       |   |   |
    |  ver  |       |  ver  |       |  ver  |
    |   |   |       |   |   |       |   |   |
    +-------+- - - -+-------+- - - -+-------+
    |       |       |  CEN  |       |       |
    |  LEF  |--hor--|   /   |--hor--|  RIG  |
    |       |       |  YOU  |       |       |
    +-------+- - - -+-------+- - - -+-------+
    |   |   |       |   |   |       |   |   |
    |  ver  |       |  ver  |       |  ver  |
    |   |   |       |   |   |       |   |   |
    +-------+- - - -+-------+- - - -+-------+
    |       |       |       |       |       |
    |  B_L  |--hor--|  BOT  |--hor--|  B_R  |
    |       |       |       |       |       |
    +-------+- - - -+-------+- - - -+-------+

    Levels can be saved to disk as 64x64 bitmaps,
    but in game there are always multiple level
    maps packed into a 512x512 allocation called
    AAC2020_PIXNAME_level16

    //:||||||||||||||||:DIAGRAMS:LEVEL16_AKA_METROID_VANIA_16://
    //:DIAGRAMS:FRACT16_FRACTAL_AUTO_TILE_SETS:||||||||||||||://

    FRACT16.D._: 16 fractal auto tiles

    16 auto tile sets with 16 depth jumps.
    Also we can slice the pixels to make:
    1. Material Tiles
    2. Bomb Tiles
    3. Sprite Tiles
    4. Light/Effects Tiles

    |<------------------------512------------------------>|
    |<----------256---------->|
    |<---128--->|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+

    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+

    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+

    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
    |32|32|32|32| |32|32|32|32| |32|32|32|32| |32|32|32|32|
    +--+--+--+--+ +--+--+--+--+ +--+--+--+--+ +--+--+--+--+
     ^^                                                 ^^
     ||                                                 ||
    Column                                       Column Of
    Of 16 terminal                               16 Outermost
    tiles.                                       nesting level
                                                 Tiles

    If you use 2-bit color, make it so a tile can only
    select from a sub-selection of 4 different tile values
    at the next nesting depth down. This determined by
    locality.

    What if we used bit packing so all these jumps could
    happen within the same set of 32 pixels? Increasing
    locality of texture fetches?

    +--+--+--+--+
    |32|32|32|32|
    +--+--+--+--+
    |32|32|32|32|
    +--+--+--+--+
    |32|32|32|32|
    +--+--+--+--+
    |32|32|32|32|
    +--+--+--+--+
     ^^ ^^ ^^ ^^
     DD CC BB AA  , these for [AA] select from these four
                    [BB] which select from these four [CC]
                    which select from these four [DD]

    BIN[ 11 ] ==[ 0 | 1 | 2 | 3 ]

    R 11 11 11 11
    G 11 11 11 11
    B 11 11 11 11
    A 11 11 11 11

    //:||||||||||||||:DIAGRAMS:FRACT16_FRACTAL_AUTO_TILE_SETS://
    //:DIAGRAMS:AUTO_TILE_EXPANSION:|||||||||||||||||||||||||://
    
        Summary: All 16 sub-tiles of auset(auto_tile_set)
                 can be created by selecting FOUR(4) of
                 the CANVAS_USER_VIEW partitions and merging
                 them together.
                 
                 The Obvious ones need no shuffling:
                 
                 TOP_LEF  |  TOP_RIG
                [00] [01] | [02] [03]
                [04] [05] | [06] [07]
                ----------|----------         
                [08] [09] | [10] [11]
                [12] [03] | [14] [15]
                 BOT_LEF  |  BOT_RIG
                
    
        +------------------------------------------------------+
        |<---- CANVAS_USER_VIEW --->|      | NEIGHBOR_BITTABLE |
        +--==--+--==--+--==--+--==--+ ---  +---------+---------+
        |      |      |      |      |  ^   |   _X_   |  _Y_    |
        |  00  |  01  |  02  |  03  |  |   |         |         |
        |      |      |      |      |  |   | _A_ _B_ | _C_ _D_ |
        +--==--+--==--+--==--+--==--+  |   | Min Max | Min Max |
        |      |      |      |      |  |   | LEF RIG | TOP BOT |
        |  04  |  05  |  06  |  07  |  |   +---------+---------|
        |      |      |      |      | 256  | EXAMPLE:          |
        +--==--+--==--+--==--+--==--+  |   | _0_ _1_ | _0_ _1_ |
        |      |      |      |      | PEB  |       (TOP)       |
        |  08  |  09  |  10  |  11  |  |   |        [0]        |
        |      |      |      |      |  |   |(RIG)[0][T][1](LEF)|
        +--==--+--==--+--==--+--==--+  |   |        [1]        |
        |      |      |      |      |  |   |       (BOT)       |
        |  12  |  13  |  14  |  15  |  |   |  T==( 0101 )==(5 )|
        |      |      |      |      |  V   |  t==( T_L Corner )|
        +--==--+--==--+--==--+--==--+ ---  +-------------------+
                         _T_ : Tile        |       (TOP)       |
          _____________  _A_ : 1000        |        [C]        |
         |    [_C_]    | _B_ : 0100        |(RIG)[A][T][B](LEF)|
         [_A_][_T_][_B_] _C_ : 0010        |        [D]        |
         |____[_D_]____| _D_ : 0001        |_______(BOT)_______|
          _____________       _______       _____________
         |    [   ]    |_00_ |       | _01_|    [   ]    |    
         [   ][_T_][   ]0000 [NON|T_C] 0001[   ][_T_][   ]    
         |____[___]____|ABCD |_______| ABCD|____[///]____|    
          _____________       _______       _____________
         |    [///]    |_02_ |       | _03_|    [///]    |    
         [   ][_T_][   ]0010 [B_C|V_P] 0011[   ][_T_][   ]    
         |____[___]____|ABCD |_______| ABCD|____[///]____|    
          _____________       _______       _____________
         |    [   ]    |_04_ |       | _05_|    [   ]    |    
         [   ][_T_][///]0100 [L_C|T_L] 0101[   ][_T_][///]    
         |____[___]____|ABCD |_______| ABCD|____[///]____|    
          _____________       _______       _____________
         |    [///]    |_06_ |       | _07_|    [///]    |    
         [   ][_T_][///]0110 [B_L|3_L] 0111[   ][_T_][///]    
         |____[___]____|ABCD |_______| ABCD|____[///]____|    
          _____________       _______       _____________
         |    [   ]    |_08_ |       | _09_|    [   ]    |    
         [///][_T_][   ]1000 [R_C|T_R] 1001[///][_T_][   ]    
         |____[___]____|ABCD |_______| ABCD|____[///]____|    
          _____________       _______       _____________
         |    [///]    |_10_ |       | _11_|    [///]    |    
         [///][_T_][   ]1010 [B_R|3_R] 1011[///][_T_][   ]    
         |____[___]____|ABCD |_______| ABCD|____[///]____|    
          _____________       _______       _____________
         |    [   ]    |_12_ |       | _13_|    [   ]    |    
         [///][_T_][///]1100 [H_P|3_T] 1101[///][_T_][///]    
         |____[___]____|ABCD |_______| ABCD|____[///]____|    
          _____________       _______       _____________
         |    [///]    |_14_ |       | _15_|    [///]    |    
         [///][_T_][///]1110 [3_B|ALL] 1111[///][_T_][///]    
         |____[___]____|ABCD |_______| ABCD|____[///]____|    
         
         NON: Non_Way (NONe Touching Tile     ) [00]
         T_C: Top_Cap (Top_Cap                ) [01]
         B_C: Bot_Cap (Bottom_Cap             ) [02]
         V_P: Ver_Pip (Vertical_Pipe          ) [03]
         L_C: Lef_Cap (Left_Cap               ) [04]
         T_L: Top_Lef (Top_Left(Corner)       ) [05]
         B_L: Bot_Lef (Bottom_Left(Corner)    ) [06]
         3_L: W_3_Lef ([3]way: [L]eft-edged   ) [07]
         R_C: Rig_Cap (Right_Cap              ) [08]
         T_R: Top_Rig (Top_Right(Corner)      ) [09]
         B_R: Bot_Rig (Bottom_Right(Corner)   ) [10]
         3_R: W_3_Rig ([3]way: [R]ight-edged  ) [11]
         H_P: Hor_Pip (Horizontal_Pipe        ) [12]
         3_T: W_3_Top ([3]way: [T]op-edged    ) [13]
         3_B: W_3_Bot ([3]way: [B]ottom-edged ) [14]
         ALL: All_Way (All_Ways(Touching)     ) [15]
         
    +---------------------------------------------------------+
    | How all 16 sub-tiles of auset(auto_tile_set) are        |
    | generated by merging sub-blocks of the                  |
    | CANVAS_USER_VIEW diagram                                |
    +----------------------------+----------------------------+
    |#00              +--+--+    |#01              +--+--+    |
    |           NON   |00|03|    |           T_C   |00|03|    |
    |   [T]    =0000= +--+--+    |   [T]    =0001= +--+--+    |
    |                 |12|15|    |   [ ]           |04|07|    |
    |                 +--+--+    |                 +--+--+    |
    +----------------------------+----------------------------+
    |#02              +--+--+    |#03              +--+--+    |
    |   [ ]     B_C   |08|11|    |   [ ]     V_P   |04|07|    |
    |   [T]    =0010= +--+--+    |   [T]    =0011= +--+--+    |
    |                 |12|15|    |   [ ]           |08|11|    |
    |                 +--+--+    |                 +--+--+    |
    +----------------------------+----------------------------+
    |#04              +--+--+    |#05              +--+--+    |
    |           L_C   |00|01|    |           T_L   |00|01|    |
    |   [T][ ] =0100= +--+--+    |   [T][ ] =0101= +--+--+    |
    |                 |12|13|    |   [ ]           |04|05|    |
    |                 +--+--+    |                 +--+--+    |
    +----------------------------+----------------------------+
    |#06              +--+--+    |#07              +--+--+    |
    |   [ ]     B_L   |08|09|    |   [ ]     3_L   |04|06|    |
    |   [T][ ] =0110= +--+--+    |   [T][ ] =0111= +--+--+    |
    |                 |12|13|    |   [ ]           |08|10|    |
    |                 +--+--+    |                 +--+--+    |
    +----------------------------+----------------------------+
    |#08              +--+--+    |#09              +--+--+    |
    |           R_C   |02|03|    |           T_R   |02|03|    |
    |[ ][T]    =1000= +--+--+    |[ ][T]    =1001= +--+--+    |
    |                 |14|15|    |   [ ]           |06|07|    |
    |                 +--+--+    |                 +--+--+    |
    +----------------------------+----------------------------+
    |#10              +--+--+    |#11              +--+--+    |
    |   [ ]     B_R   |10|11|    |   [ ]     3_R   |05|07|    |
    |[ ][T]    =1010= +--+--+    |[ ][T]    =1011= +--+--+    |
    |                 |14|15|    |   [ ]           |09|11|    |
    |                 +--+--+    |                 +--+--+    |
    +----------------------------+----------------------------+
    |#12              +--+--+    |#13              +--+--+    |
    |           H_P   |01|02|    |           3_T   |01|02|    |
    |[ ][T][ ] =1100= +--+--+    |[ ][T][ ] =1101= +--+--+    |
    |                 |13|14|    |   [ ]           |09|10|    |
    |                 +--+--+    |                 +--+--+    |
    +----------------------------+----------------------------+
    |#14              +--+--+    |#15              +--+--+    |
    |   [ ]     3_B   |05|06|    |   [ ]     ALL   |05|06|    |
    |[ ][T][ ] =1110= +--+--+    |[ ][T][ ] =1111= +--+--+    |
    |                 |13|14|    |   [ ]           |09|10|    |
    |                 +--+--+    |                 +--+--+    |
    +----------------------------+----------------------------+ 
    
    //:|||||||||||||||||||||||||:DIAGRAMS:AUTO_TILE_EXPANSION://
    //:DIAGRAMS:ATE_Subtile_User_View:|||||||||||||||||||||||://
    
            ATE: AUTO_TILE_EXPANSION (Auto_Tile_Expansion)
            SUV: SUBTILE_USER_VIEW   (Subtile_User_View  )
            CUV:  CANVAS_USER_VIEW   ( Canvas_User_View  )
        DIA_SEC: Diagram_Section
        DIA_ONE: Diagram_One (One diagram)
        
        This section expands upon DIA_SEC[ AUTO_TILE_EXPANSION ]
        and DIA_ONE[ #CANVAS_USER_VIEW# ]. In order to render
        a single sub-tile in PAINT5D editor, this is how you
        would do it.
                                      |<---- 256 ---->|
        |<-- CUV -->|  |<SUV>|        |<---- CUV ---->|
        +--+--+--+--+  +--+--+        +-=-+-=-+-=-+-=-+<--=-->
        |__|__|__|__|  |__|__|        | 0 | 1 | 2 | 3 |   |   
        |  |  |  |  |  |  |  |        +-=-+-=-+-=-+-=-+<  |  >
        +--+--+--+--+  +--+--+        | 4 | 5 | 6 | 7 |  HEX  
        |__|__|__|__|  .     .        +-=-+-=-+-=-+-=-+< SUB >
        |  |  |  |  |  .     .     +--> 8 | 9 | A | B |  CEL  
        +-----=-----+  .     .     |  +-=-+-=-+-=-+-=-+<  |  >
        |<-- 256 -->|  |<128>|     +--> C | D | E | F |   |   
                                   |  +-=-+-=-+-=-+-=-+<--=-->
                                   |      .   .   .
                 [ C16_Cell ](S)---+      +-=-+-=-+
                 [ cuvcell  ]             | 5 | 6 |
                                          +-=-+-=-+
                                          | 9 | A |
                                          +-=-+-=-+
                                          |<-SUV->|
                                          |<-128->|
                                          
        suvquad_CTO_cuvcell
                          
        cuv_CTO_suv (cuvipix_CTO_suvipix)  :
            
            Converts  Canvas_User_View pixel coord
            into a   Subtile_User_View pixel coord.
            
            I32
            cuv_i_x_CTO_suv_i_x(
                        cuv_i_x //:Canvas_User_View:i_x
                       ,suv_dex //:Subtil_User_View:DEX
            )
            {
            
            }
            
            I32
            cuv_i_y_CTO_suv_i_y(
                        cuv_i_y //:Canvas_User_View:i_y
                       ,suv_dex //:Subtil_User_View:DEX
            )
            {
            
            }
            
            IV2
            cuv_CTO_suv_YFC( /**Yes_Function_Calls**/
            ,   cuv_i_x
            ,   cuv_i_y
            ,   suv_dex
            ){
            /** ******************************************** ***
                  IDENTICAL_TRANSFORMS[ cuv_CTO_suv_NFC ]
                  IDENTICAL_TRANSFORMS[ cuv_CTO_suv_YFC ]
                  
                  DIFFERENT_IMPLEMENTS[ cuv_CTO_suv_NFC ]
                  DIFFERENT_IMPLEMENTS[ cuv_CTO_suv_YFC ]
            *** ******************************************** **/
                //:GET_SUV:----------------------------------://
                //: Broken into TWO function calls.          ://
                //: One(1) for each axis because it makes    ://
                //: calling the function "resursively" .     ://
                //: easier. Though I don't plan on using this://
                //: function recursively, writing it this way://
                //: will give me insight I will need a few   ://
                //: months from now when working on the      ://
                //: fractal aspects of engine.               ://
                //: Written_On[ DATE[ 2021_02_26 ] ]         ://
                //:GET_SUV:- - - - - - - - - - - - - - - - - ://
                
                    //:SUV: Subtile_User_View( Pixel Coord ).
                    //:A[ SUV ]Is really just a re-mapped[ CUV ].
                    //:Any[ SUV ]value is a valid[ CUV ]value.
                    //: 
                    //:   Something fractalish like this would be
                    //:   a meaningful transform. And by chaning 
                    //:   the "dex" value we could
                    //:
                    //:   cuv_CTO_suv_YFC( 
                    //:      (cuv_CTO_suv_YFC( x,y,dex )).x
                    //:     ,(cuv_CTO_suv_YFC( x,y,dex )).y
                    //:     , dex
                    //:   );;
                    IV2 suv; 
                    suv.x =( cuv_i_x_CTO_suv_i_x(
                             cuv_i_x  ,  suv_dex );;
                    suv.y =( cuv_i_y_CTO_suv_i_y(
                             cuv_i_y  ,  suv_dex );;
                //:----------------------------------:GET_SUV://
            
            };;
            
            IV2
            cuv_CTO_suv_NFC( /**No_Function_Calls**/
                cuv_i_x
            ,   cuv_i_y
            ,   suv_dex //:SUV's subtile inDEX to render.
                        //:A "suv_dex" is a "sub_dex" but a
                        //:"sub_dex" is not always a "suv_dex".
                        //:"suv_dex" >>> Auto_Tile_Sub_Tile_DEX
            )           //:"sub_dex" === Auto_Tile_Sub_Tile_DEX
            {
            /** ******************************************** ***
                  IDENTICAL_TRANSFORMS[ cuv_CTO_suv_NFC ]
                  IDENTICAL_TRANSFORMS[ cuv_CTO_suv_YFC ]
                  
                  DIFFERENT_IMPLEMENTS[ cuv_CTO_suv_NFC ]
                  DIFFERENT_IMPLEMENTS[ cuv_CTO_suv_YFC ]
            *** ******************************************** **/
            
                I32 suv_q_x ; //:SubtileUserView: Quad_X
                I32 suv_q_y ; //:SubtileUserView: Quad_Y
                suv_q_x =( cuv_i_x / 128 ); //:SubQuad:X
                suv_q_y =( cuv_i_y / 128 ); //:SubQuad:Y
                
                I32 suvquad ; //:[ suv_q_x , suv_q_y ]As_1D_Dex
                suvquad =( suv_q_x + ( suv_q_y * 4 ) );
                
                I32 cuvcell; //:Canvas_User_View CELL (C16_Cell)
                cuvcell=(
                suvquad_AND_suv_dex_CTO_cuvcell(
                suvquad  ,  suv_dex ));;
                
                I32 cuv_c_x ; //:cuvcell as 2D XY , cell_x
                I32 cuv_c_y ; //:cuvcell as 2D XY , cell y
                cuv_c_x =( INDEX_TO_XY_FORMULA_ON[ cuvcell ] );
                cuv_c_y =( INDEX_TO_XY_FORMULA_ON[ cuvcell ] );
                
                //: cuvloc: Canvas_User_View_Local(ToCell)Pixel:
                I32 cuvlocx = xxxxxxxxxxxx;
                I32 cuvlocy = xxxxxxxxxxxx;
                
                //: cuv_bas: Canvas_User_View base address of
                //:          the[ cuvcell ]you are inside of.
                //:          measured in pixels.
                I32 cuvbasx = xxxxxxxxxxxxxx;
                I32 cuvbasy = xxxxxxxxxxxxx;
                
                suv.x =( cuvbasx + cuvlocx );
                suv.y =( cuvbasy + cuvlocy );
                
          
                
                IV2 suv
            }
                                      
    //:|||||||||||||||||||||||:DIAGRAMS:ATE_Subtile_User_View://
    //:DIAGRAMS:RENDER_CORE_FLOW:============================://
        //:ABOUT:============================================://

            RENCORE_******* functions are part of the 
            extension system. Allows code base users to 
            inject custom rendering code without having to
            deal with the nitty gritty data retrieval and
            display problems.

            @VID_IID[ 0258 ]TIME[ 05:52:00 ]REVIEW_SECTION

        //:VARIABLE_NAMES:===================================://

        RENCORE : RENder_CORe

        tilodat : TILe_LOcal_DATa ( @_CONCEPTUAL_OBJECT_@ )
                  tilodat==(a_d,t_l,t_e,t_v,tou,p_x,p_y)

        tilpixu : TILe_PIXels:Uint32
        tilpixa : TILe_PIXels:Array
        
        laypixu : LAYer_PIXels:Uint32
        laypixa : LAYer_PIXels:Array

        plypix3 : PLY( as in toilet paper )PIXels 3 (3 layers)

        //:===================================:VARIABLE_NAMES://
        //:FAKE_CODE:========================================://

        FOR_EACH[[[ t_l / til_lay ]]]
        FOR_EACH[[[ t_e / til_exp ]]]

            tilpixu=(
            AAC2020_PAINT5D_RENCORE_tilodat_CTO_tilpixu(
                a_d     //:AKA[ aus_dex ]¯¯¯¯|¯¯¯¯
            ,   t_l     //:AKA[ til_lay ]    |
            ,   t_e     //:AKA[ til_exp ]    |
            ,   t_v     //:AKA[ til_val ] tilodat
            ,   tou     //:AKA[ tou_val ]    |
            ,   p_x     //:AKA[ tilop_x ]    |
            ,   p_y     //:AKA[ tilop_y ]____|____
            ));;
            tilpixa[ t_e ]=( tilpixu );

        NEXT[[[ t_e / til_exp ]]]
        
            laypixu=(
            AAC2020_PAINT5D_RENCORE_tilpixa_CTO_laypixu(
                                    tilpixa ));;

            laypixa[ t_l ]=( laypixu );

        NEXT[[[ t_l / til_lay ]]]

        OUTSIDE_THE_LOOP:

            plypix3=(
            AAC2020_PAINT5D_RENCORE_laypixa_CTO_plypix3(
                                    laypixa ));;

        //:========================================:FAKE_CODE://
        //:PROGRAM_FLOW:=====================================://

            tilodat
               |   \__RENCORE_tilodat_CTO_tilpixu
               V   /  (HOW_TO: Render Individual Tiles)
            tilpixu
            tilpixa
               |   \__RENCORE_tilpixa_CTO_laypixu
               V   /  (HOW_TO: Composite Tiles On Same Layer)
            laypixu
            laypixa
               |   \__RENCORE_laypixa_CTO_plypix3
               V   /  (HOW_TO: Composite 3 Flattened Layers )
            plypix3

        //:=====================================:PROGRAM_FLOW://

    //:============================:DIAGRAMS:RENDER_CORE_FLOW://
    //:=============================================:DIAGRAMS://
    //:VARIABLE_NAME_INDEX:==================================://
    
        sub_dex : Ambgious, choose[ suv_dex | ast_dex ]
        aus_sub : Ambigious, USE[ ast_dex ]
        ast_dex : Auset_Sub_Tile:inDEX
        suv_dex : Subtile_User_View:DEX (DEX==ast_dex)
        
        suv_q_y : Subtile_User_View_QUAD: Y ( 2D Coord )
        suv_q_y : Subtile_User_View_QUAD: X ( 2D Coord )
        suvquad : Subtile_User_View_QUAD    ( 1D Index )
    
        cuvcell : Canvas_User_View CELL (C16_Cell)( 1D Index )
        
        cuv_c_x : CUVcell_Cell_X (cuvcell(1D) as 2D Coord)
        cuv_c_y : CUVcell_Cell_Y (cuvcell(1D) as 2D Coord)
        
        cuv_bas : Canvas_User_View:BASe(address/pixelcoord)
        cuvbasx : Canvas_User_View:BASe(address/pixelcoord)X
        cuvbasy : Canvas_User_View:BASe(address/pixelcoord)Y
        
          suv.x : Subtile_User_View:[ pixel/integer]:X
          suv.y : Subtile_User_View:[ pixel/integer]:Y
    
    //:==================================:VARIABLE_NAME_INDEX://
    //:FUNCTION_NAME_INDEX:==================================://
    
        //:TODO: Function Names Here and what they mean.
    
    //:==================================:FUNCTION_NAME_INDEX://
    //:IT_WRONG:=============================================://
    
        BAD[ dex_sub ]USE[ sub_dex ]
        BAD[ sub_aus ]USE[ aus_sub ]
        BAD[ dex_ast ]USE[ ast_dex ]
        BAD[ dex_suv ]USE[ suv_dex ]
        BAD[ cellcuv ]USE[ cuvcell ]
        BAD[ bascuvx ]USE[ cuvbasx ]
        BAD[ bascuvy ]USE[ cuvbasy ]
    
    //:============================================:ITS_WRONG://
    //:LIBCHAN_AND_LIBCHAN_DIAGRAM:==========================://

        +------------+
        | 1: SILENCE |
        | 2: KILTEST |
        | 3: REENUTR |
        | 4: TODOMAN |
        +------------+
        
         GAMTICK 

         CEDITOR
         
                  +-------+---+++++++---+
                  |FILEBOI| 1 ||||||| 2 |
                  +-------+-^-+++++++-^-+
                            ^         ^
                      +-----^-+ +-----^-+
                      |PHEXDUM| |NATIDUI|
                      +-----^-+ +-------+
                            ^
                      +-----^-+
                      |HARDASS|
                      +-------+
        
        +-----------------------------------------------+
        | Native functions  (NATIKEY,NATIMOU) included  |
        | BEFORE containers (IKEYBOX,IMOUBOX) so that   |
        | native functions CANNOT directly put their    |
        | results into containers. Forcing code to      |
        | be more flat where these two objects          |
        | interact.                                     |
        +-----------------+-----------------------------+
        | +-------------+ |
        | | * : NATIKEY | |
        | | * : NATIMOU | |
        | +-^-----------+ |
        |   ^             |
        | +-^-----------+ |   
        | | * : IKEYBOX <<<<<<<+--------------------------+
        | | * : IMOUBOX | |    | +---------+  +---------+ |
        | +-------------+ |    | | KEYBIND |  | IKEYLIS | |
        +-----------------+    | +---------+  | IKEYCMD | |
                               |              +---------+ |
                               +--------------------------+
        
        
        
        
        [WIN32_NATIVE_WINDOW]------------------------------+
        |  +-------------+                                 |
        |  | 1 : GINAMOU | GINAWIN's [MOU]se handler code. |
        |  +-------------+                                 |
        |  | 2 : GINAWIN | Graphics_Init_And_WINdow        |
        |  +-------------+                                 |
        +--------------------------------------------------+
        
        [OPENGL:NOT_SETUP]--------------+
        | 1:GLEBIND : BINDINGS  (FUNCS) |
        | 2:GLCONST : CONSTANTS (DATA ) |
        +-------------------------------+
        
            
        +----------------------------+
        |WINDOW_SIZE & MOUSE_POSITION|
        +-------++++++++++++++-------+
        |IMOUBOX||||||||||||||GINAWIN|
        +-------++++++++++++++-------+ 
        |                            |
        +----------------------------+
        | 1 |
        +-^-+
          ^
        +-^-----+ 
        |CPUNIFO|
        +---^---+
            ^  
        +---^---+
        |GRAQUAD|   
        +---^---+
            ^
        +---^---+
        |FRAGBED|   
        +-------+
        
            +-------+---+---+---+---+---+---+
            |PIXNAME| 1 | 2 | 3 | 4 | 5 | 6 |
            +-------+-^-+-^-+-^-+-^-+-^-+-^-+
                      ^   ^   ^   ^   ^   ^
                +-----^-+ ^   ^   ^   ^   ^
                |PIXSAVE|-^-+ ^   ^   ^   ^
                +---|PIXBACK|-^-+ ^   ^   ^
                    +---|GPUDATA|-^-+ ^   ^
                        +---|PIXPUSH|-^-+ ^
                            +---|PIXLOAD|-^-+
                                +---|DUMPASS| 
                                    +-------+
                                    
            +------------------------------------+
            |GENTCOM : GENerateTile:COMmon(code) |
            +-------------+----------------------+
            | * : GENTDOW : DOWNscale algorithm  |
            | * : GENTUPP :  UPPscale algorithm  |
            +-------------+----------------------+
            
            +----------------------------------------+
            |POLYOGL:POLYfills_OpenGL.(CPU-side GLSL)|
            +-------+-----------+--------------------+
            |POLYOGL| 1 | 2 | 3 |                    |
            +-------+-^---^-----+--------------------+
                      ^   ^
                +-----^-+ ^   
                |FRAGCOM| ^   
                +-----^-+ ^   
                      ^   ^
                      ^   ^
                  +---^---^--------------------------------+
                  [ EDITOR_SHADERS ::::::::::::::::::::::: |
                  [ Order doesn't matter strictly, but     |
                  [ should be in the order associated with |
                  [ it's number key on keyboard.           |
                  | +---+-------+                          |
                  | | 0 |GPUVIEW|>>> PIXNAME_taudepo       |
                  | +---+-------+    PIXNAME_******* (ANY) |
                  | +---+-------+                          |
                  | | 1 |P5D1OGL|>>> PIXNAME_paint5d       |
                  | +---+-------+                          |
                  |                                        |
                  | Any system in this group can           |
                  | directly reference:                    |
                  | 1: POLYOGL                             |
                  | 2: FRAGCOM                             |
                  +----------------------------------------+
                  
                  +----------------------------------------+
                  [ TAU:Texture_As_Uniform:                |
                  [ Storing GLSL uniforms using a 512x512  |
                  [ block of memory known as "taudepo"     |
                  +----------------------------------------+
                  | 1 : TAUDIRT : Dirty Flags "Quad"tree   |
                  | 2 : TAUDEPO : Var Locations On Texture |
                  | 3 : TAUTYPE : Treat Pixels As Types    |
                  | 4 : TAUSYNC : CPU<==>GPU Synchronize   |
                  +----------------------------------------+
                  | TAUTYPE comes BEFORE TAUSYNC so that   |
                  | TAUTYPE variables are not allowed to   |
                  | synchronize with GPU on a granular     |
                  | level. Sync all edited [GPU<==>CPU]    |
                  | variables once per frame.              |
                  +----------------------------------------+
                
                    
        [ COMMON_EDITOR_INPUT_TRANSFORMATION_FUNCTIONS ]-------+
        |                                                      |
        | +-------------+                                      |
        | | * : ZOOMCOM |<< Zoom  Functions For Editor Controls|
        | +-------------+                                      |
        | +-------------+                                      |
        | | * : DRAGCOM |<< Drag  Functions For Editor Controls|
        | +-------------+                                      |
        | +-------------+                                      |
        | | * : CLICKOM |<< Click Functions For Editor Controls|
        | +-------------+                                      |
        +-^----------------------------------------------------+
          ^
        +-^----------------------------------------------------+
        | EDITOR Camera Functions:                             |
        | There are TWO styles of editor cameras:              |
        | 1. EDITCAM: Camera behaves like EDITOR               |
        | 2. GAMECAM: Camera behaves like GAME                 |
        |                                                      |
        | AAC2020 is EDITOR-Centric. Meaning in-game action    |
        | is still technically an "EDITOR". But it is an       |
        | editor designed for gameplay instead of asset        |
        | creation. Alternatively, gameplay may be inside      |
        | an asset creation editor where the controls have     |
        | been put into a "gameplay" scheme rather than        |
        | an "editor" scheme.                                  |
        +------------------------------------------------------+
        | +-------------+                                      |
        | | * : EDITCAM | EDITOR---like input transformations. |  
        | +-------------+          FUNCTIONS_ONLY, __NO__DATA__|    
        | +-------------+                                      |
        | | * : GAMECAM | GAMEPLAY-like input transformations. |  
        | +-------------+          FUNCTIONS_ONLY, __NO__DATA__|
        +------------------------------------------------------+
        
        +-------------------------------------+
        | MOUSE_STATE + CURRENT(ACTIVE)EDITOR |
        +-----------+---------------+---------+
        | +-------+ |               |         |
        | |IMOUBOX| |               |         |
        | +---^---+ |               |         |
        |     ^     |[[[[[[ + ]]]]]]| CEDITOR |
        | +---^---+ |               |         |
        | |MOUTEMP| |               |         |
        | +---^---+ |               |         |
        +-----------+-------^-------+---------+
                            ^
                            ^
        +-------------------^-----------------+
        | AACMAIN : Main Input Handler        |
        +-------------------------------------+
        |  Called in system dependency order: |
        |                                     |
        |  1: PAINT5D.<MOUSE_INPUT_HANDLER>   |
        |                                     |
        +-------------------------------------+
        
        #PATTERN_BREAKERS#:----------------------------------+
        |                                                    |
        |   1. PAINT5D system is broken into:                |
        |       A: PAINT5D (CPU side code)                   |
        |       B: P5D1OGL (GPU side code)                   |
        |       In retrospect, should have just created a    |
        |       "PAINT5D.FRA._" file instead for where to    |
        |       put PAINT5D fragment shader code.            |
        +----------------------------------------------------+
        
        //:DENSE_DEPENDENCY_GRAPH:---------------------------://
        
            Some systems may appear in multiple groups.
            
            Lower Lettered groups must be included before
            higher lettered groups.
            
            Systems that occur in more than one group use the
            ordering of their LOWEST lettered group when
            solving the dependency graph in[ AAC2020.C11 ]
            and[ LIBCHAN.TOP._ + LIBCHAN.BOT._ ].
            
            LETTERS(AZ): Groups
            NUMBERS(##): Order Matters Within Group
            STARS(  **): __ANY__ Order Within Group
            UPP: Upstream Dependency
        
            _A.01:SILENCE  _B.01:FILEBOI  _C.**:NATIKEY
            _A.02:KILTEST  _B.02:PHEXDUM  _C.**:NATIMOU
            _A.03:REENUTR  _B.03:HARDASS  _D.**:IKEYBOX
            _A.04:TODOMAN                 _D.**:IMOUBOX
            
            _E.**:KEYBIND  _F.01:IKEYLIS  _G.**:CEDITOR
                           _F.02:IKEYCMD
                
            _H.01:GINAMOU <<< _L:MOUTEM   _J.01:GLEBIND
            _H.02:GINAWIN     _I:NATDUI   _J.02:GLCONST
            
            +---------------+ +------------------+
            |   UPP:KEYBIND | |      UPP:FILEBOI |
            +---------------+ +------------------+ 
            | _K.01:CPUINFO | | _M.01.--.PIXNAME | 
            | _K.02:GRAQUAD | | _M.02.**.PIXSAVE | 
            | _K.03:FRAGBED | | _M.02.**.PIXBACK |
            +---------------+ | _M.03.01.GPUDATA |
            +---------------+ | _M.03.**.PIXPUSH |
            |   UPP:FILEBOI | | _M.03.**.PIXLOAD |
            |   UPP:PIXNAME | +------------------+
            +---------------+ +---------------+
            | _N.01:HARDASS | |   UPP:PIXNAME |
            | _N.02:DUMPASS | +---------------+
            +---------------+ | _P.01:POLYOGL |
            +---------------+ | _P.**:FRAGCOM |
            |   UPP:PIXNAME | +---------------+
            +---------------+ +---------------+
            | _O.01:GENTCOM | |   UPP:PIXNAME |
            | _O.**:GENTDOW | +---------------+
            | _O.**:GENTUPP | | _Q.01:GPUWIRE |
            +---------------+ | _Q.02:GPUVIEW |
            +---------------+ +---------------+
            |   UPP:PIXNAME | +---------------+
            +---------------+ |   UPP:<NONE!> |
            | _R.01:TAUDIRT | +---------------+
            | _R.02:TAUDEPO | | _S.**:ZOOMCOM |
            | _R.03:TAUTYPE | | _S.**:DRAGCOM |
            | _R.04:TAUSYNC | | _S.**:CLICKOM |
            +---------------+ +---------------+
            +---------------+ +---------------+
            |    UPP:[ _S ] | |   UPP:PIXNAME |
            +---------------+ +---------------+
            | _T.**:EDITCAM | | _U.01:PAINT5D |
            | _T.**:GAMECAM | | _U.02:P5D1OGL |
            +---------------+ +---------------+
            
        //:---------------------------:DENSE_DEPENDENCY_GRAPH://

    //:==========================:LIBCHAN_AND_LIBCHAN_DIAGRAM://
    
    
    
    
    
    
    
    