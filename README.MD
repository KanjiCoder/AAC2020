# AAC2020 : Atomic Alice C11 2020

## INDEX:
### 01: ABOUT
### 02: DEVELOPER_TIME_COSTS
### 03: CONCEPTUAL_TYPES
### 04: DIAGRAMS
### 05: DIAGRAMS_UN_OFFICIAL (Brain storming)
### 06: VARIABLE_NAME_INDEX
### 07: FUNCTION_NAME_INDEX
### 08: ITS_WRONG
### 09: LIBCHAN_AND_LIBCHAN_DIAGRAM
### 10: ASCII_VALUES_IN_128_TO_255_RANGE

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

                UPDATE: I am a hypocrite and sometimes do this
                        but try to avoid it. It always ends up
                        making the code base HARDER to navigate.
                    
                        But sometimes splitting things into
                        include files helps you focus when
                        a certain feature gets really 
                        difficult to figure out...
        
                        Maybe re-integrate the #include file
                        into the main file once you have
                        cracked the problem? Not sure.
                        -John Mark (DATE:2021_04_24)

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
                gaurantee the correctness of a program.
    
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
    //:DIAGRAMS:RENDER_CORE_FLOW:||||||||||||||||||||||||||||://
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

    //:||||||||||||||||||||||||||||:DIAGRAMS:RENDER_CORE_FLOW://
    //:DIAGRAMS:TOUCHING_VALUE:||||||||||||||||||||||||||||||://

        #_TOUCHING_VALUE_BITS_# #_WANG_STYLE_#
        #_NEIGHBOR_VALUE_BITS_#  #WANG_STYLE#

            We are using[ WANG_STYLE ]auto tiling.
            Which requires 16 sub-tiles in an[ auset ].
            ( auset == auto tile set ).

            REF_FOR_SMART_PEOPLE[ tinyurl.com/NVIDIA-WANG ]
            REF_EASY_FOR_ME[        tinyurl.com/EASY-WANG ]

        @tou_val@ @_tou_val_@ <--[ CTRL_F_HELP ]
       
        //|----------------------------------------|//
        //|Layout of bits for touching pattern:    |//
        //|TOUCHING:  ___  ___  ,  ___  ___        |//
        //|           X_0  X_1     Y_0  Y_1        |//
        //|           LEF  RIG     TOP  BOT        |//
        //|                       (UPP)(DOW)       |//
        //|                                        |//
        //|           Y_0          AHK ShortCut:   |//
        //|        +---+---+       (AutoHotKey)    |//
        //|        | TILE  |       [TOUCH_DIAGRAM] |//
        //|    X_0 |  ON   | X_1                   |//
        //|        |SCREEN |                       |//
        //|        +---+---+                       |//
        //|           Y_1                          |//
        //|----------------------------------------|//
            
             0 <<<<<<<<<<<<<<<<<<<<< TOUSHIF_X_0 ==( 3 )
             |    0 <<<<<<<<<<<<<<<< TOUSHIF_X_1 ==( 2 )
             |    |       0 <<<<<<<< TOUSHIF_Y_0 ==( 1 )
             |    |       |    0 <<< TOUSHIF_Y_1 ==( 0 )
             0    0   |   0    0 
            ___  ___  |  ___  ___
            X_0  X_1  |  Y_0  Y_1 <--NETWORKISH_BYTE_ORDER
                                    (I guess "bit" order )



          @VID_IID[ 0258 ]TIME[ 00:23:00 ]MAKING_CHECKSUMS
          TOUCHING_CHECKSUM_X_0 =( 8 )
          TOUCHING_CHECKSUM_X_1 =( 8 )
          TOUCHING_CHECKSUM_Y_0 =( 8 )
          TOUCHING_CHECKSUM_Y_1 =( 8 )

          +-------+
          |       |    0    0   |   0    0   | BIN[ 0000 ]
          |   o   |   ___  ___  |  ___  ___  | DEC[    0 ]
          |       |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x00 ]
          +-------+

          +-------+
          |       |    0    0   |   0    1   | BIN[ 0001 ]
          |   o   |   ___  ___  |  ___  ___  | DEC[    1 ]
          |   |   |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x01 ]
          +---+---+

          +---+---+
          |   |   |    0    0   |   1    0   | BIN[ 0010 ]
          |   o   |   ___  ___  |  ___  ___  | DEC[    2 ]
          |       |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x02 ]
          +-------+
 
          +---+---+
          |   |   |    0    0   |   1    1   | BIN[ 0011 ]
          |   o   |   ___  ___  |  ___  ___  | DEC[    3 ]
          |   |   |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x03 ]
          +---+---+

          +-------+
          |       |    0    1   |   0    0   | BIN[ 0100 ]
          |   o---+   ___  ___  |  ___  ___  | DEC[    4 ]
          |       |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x04 ]
          +-------+

          +-------+
          |       |    0    1   |   0    1   | BIN[ 0101 ]
          |   o---+   ___  ___  |  ___  ___  | DEC[    5 ]
          |   |   |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x05 ]
          +---+---+

          +---+---+
          |   |   |    0    1   |   1    0   | BIN[ 0110 ]
          |   o---+   ___  ___  |  ___  ___  | DEC[    6 ]
          |       |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x06 ]
          +-------+

          +---+---+
          |   |   |    0    1   |   1    1   | BIN[ 0111 ]
          |   o---+   ___  ___  |  ___  ___  | DEC[    7 ]
          |   |   |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x07 ]
          +---+---+

          +-------+
          |       |    1    0   |   0    0   | BIN[ 1000 ]
          +---o   |   ___  ___  |  ___  ___  | DEC[    8 ]
          |       |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x08 ]
          +-------+

          +-------+
          |       |    1    0   |   0    1   | BIN[ 1001 ]
          +---o   |   ___  ___  |  ___  ___  | DEC[    9 ]
          |   |   |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x09 ]
          +---+---+

          +---+---+
          |   |   |    1    0   |   1    0   | BIN[ 1010 ]
          +---o   |   ___  ___  |  ___  ___  | DEC[   10 ]
          |       |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x0A ]
          +-------+

          +---+---+
          |   |   |    1    0   |   1    1   | BIN[ 1011 ]
          +---o   |   ___  ___  |  ___  ___  | DEC[   11 ]
          |   |   |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x0B ]
          +---+---+

          +-------+
          |       |    1    1   |   0    0   | BIN[ 1100 ]
          +---o---+   ___  ___  |  ___  ___  | DEC[   12 ]
          |       |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x0C ]
          +-------+

          +-------+
          |       |    1    1   |   0    1   | BIN[ 1101 ]
          +---o---+   ___  ___  |  ___  ___  | DEC[   13 ]
          |   |   |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x0D ]
          +---+---+

          +---+---+
          |   |   |    1    1   |   1    0   | BIN[ 1110 ]
          +---o---+   ___  ___  |  ___  ___  | DEC[   14 ]
          |       |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x0E ]
          +-------+

          +---+---+
          |   |   |    1    1   |   1    1   | BIN[ 1111 ]
          +---o---+   ___  ___  |  ___  ___  | DEC[   15 ]
          |   |   |   X_0  X_1  |  Y_0  Y_1  | HEX[ 0x0F ]
          +---+---+


        Use binary value to grab correct graphic based on
        the decimal index the binary value evaluates to:
        +---+---+---+---+---+---+---+---+
        | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
        +---+---+---+---+---+---+---+---+

        ....                +---+---+---+---+---+---+---+---+
        ....                | 8 | 9 |10 |11 |12 |13 |14 |15 |
        ....                +---+---+---+---+---+---+---+---+


        @VID_IID[ 0269 ]TIME[ 02:04:42 ]
        Figuring_Out_3D_With[ marksongs ]
        2D: BIN[ 1111     ]DEC[ 15 ]
        3D: BIN[ 1111  11 ]DEC[ 63 ]
        +---|---+---|---+---|---+
        |       |       |       |
        |       |  y_0  |       |
        |       |       |       |   
        +---|---+---|---+---|---+   
        |       |       |       |     
        |  x_0  |  TIL  |  x_1  |
        |       |       |       |
        +---|---+---|---+---|---+
        |       |       |       |
        |       |  y_1  |       |
        |       |       |       |
        +---|---+---|---+---|---+

    //:||||||||||||||||||||||||||||||:DIAGRAMS:TOUCHING_VALUE://
    //:DIAGRAMS:CLUDMAP(ing):||||||||||||||||||||||||||||||||://

        @VID_IID[ 0259 ]TIME[ 03:07:42 ]MOVING_THINGS_AROUND

        VP0:Viewport_Zero(0): (Destination/Screen Viewport)
        VP1:Viewport_One(1): (Offscreen/Source/Data/Tilemap)

        AAC2020_P5D1OGL_CludMap_ZOF_1_D :
            Cludmap ZERo_OFset , 1-dimensional

        AAC2020_P5D1OGL_CludMap_RNG_1_D :
            CludMap Using RANG , 1-dimensional

        AAC2020_P5D1OGL_CludMap_fic_vp0_vp1_clu :
            CludMap Using:
                1. fic: Fragment Integer Coord (fic)
                2. vp0: VP0 selection rectangle.
                3. vp1: VP1 selection rectangle.
                4. clu: Pebble Size (Cluster_Size)
  
    
        |<-------- input_range -------->|
        |0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F|
        |       |       |       |       |
        |0|1|2|3| 
        |<- out ->|(output_range)
    
        Cluster_Size==( 1 )
        |<-------- input_range -------->|
        |0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F|
        |0.0    |0.0    |0.0    |0.0    |
        |1.0    |1.0    |1.0    |1.0    |

        Cluster_Size==( 2 )
        |<-------- input_range -------->|
        |0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F|
        |0.0            |0.0            |
        |1.0            |1.0            |

        1 ==> 0.5

        +---+---+---+---+
        |   |   |   |   |
        +---+   +---+   +
        |       |       |
        +---+---+  ---  +
        |   |           |
        +---+   |       +
        |               |
        +---+---+---+---+

        NOTE_02: Ditched[ 0x400000 ]Scaling_Idea_From[ NOTE_01 ]
                 @VID_IID[ 0261 ]TIME[ 04:13:50 ]
        NOTE_01: We need to map each discreet[ cuvipix ][x/y]
                 value to a larger tile with dimensions...
                 [ 0x400000 -BY- 0x400000 ].
                 
                 0x400000 is i32 max value divided by 256 and
                 then rounded down to the nearest power of 2.
                 
                 The idea is that I want do all my calculations
                 in discrete units before I convert to float32
                 percentage coordinates.

            
        cuvipix : Canvas_User_View_PIXels
        cu4mpix : Canvas_User_4Million_PIX (upscaled:cuvipix)

        //:NOT_CERTAIN_ABOUT_THIS_DIAGRAM:===================://
        @VID_IID[ 0260 ]TIME[ 00:22:32 ]WHY_NOT_CERTAIN       
        @VID_IID[ 0261 ]TIME[ 01:58:00 ]SOMEWHAT_NONSENSE

            |1_DATAPIX_1|  <--EXTACTLY_ONE_DATA_PIXEL
            |<-p5d_vp1->|  ( VP1 : Offscreen/Source/TileMap)
            |<-cuvipix->|  ( VP0 : Destination/Screen      )
            +---+---+---+ 
            | 0 | 1 | 2 | <--[ UPSCALE:( cuvipix --> cu4mpix ) ]
            +---+---+---+    [ @VID_IID[ 0261 ]T[ 04:10:10 ]   ]
            |   |   |   |    [ 3 cells == 0x400000 units       ]
            |   |   |   +-----------------------------------+
            |   |   +-----------------------+               |
            |   +-----------+               |               |
            |               |               |               |
            +---------------+---------------+---------------+
            |       0       |       1       |       2       |
            +---------------+-------^-------+---------------+
            ^               ^       |       ^               ^
            |<- 0x400000  ->|<- 0x400000  ->|<- 0x400000  ->|
            |<----------------- cu4mpix ------------------->|
            ^                       |                       ^
            |     +-----------------+                       |
            +-+   |   +-------------------------------------+
              |   |   |
            +-|-+-|-+-|-+ 
            | 0 | 1 | 2 | <--[ When Mapping. Hit The Edges    ]
            +---+---+---+    [ To make sure tiles end up with ]
            |<-p5d_vp0->|    [ 100% coord values on their     ]
                             [ edges.                         ]

            p5d_vp0:pixel[ 0 ] ==> (-1.0 tilop_x of cuvipix[0])
            p5d_vp0:pixel[ 1 ] ==> ( 0.0 tilop_x of cuvipix[1])
            p5d_vp0:pixel[ 2 ] ==> (+1.0 tilop_x of cuvipix[2])

        //:===================:NOT_CERTAIN_ABOUT_THIS_DIAGRAM://
        //:SOLVE_IT_1_DIMENSIONALLY:=========================://
        @VID_IID[ 0260 ]TIME[ 01:48:42 ]SECTION_OVERVIEW

            //:SEE[ aac2020_P5D1OGL_UTC_CludMap_ZOF_1_D ]
            //:FOR[ A_Test_Implementing_These_Diagrams  ]
            //:REF[ @VID_IID[ 0261 ]TIME[ 04:15:23 ]    ]

            //:TILOPER_DIAGRAM:------------------------------://
            @VID_IID[ 0260 ]TIME[ 01:37:50 ]FIGURING_IT_OUT

        #_DIA_TILOPER_#|  0/4  |  1/4  |  2/4  |  3/4  |  4/4  |

                       +-------+-------+-------+-------+-------+
            tilop_x -->|-1.00f |-0.50f | 0.00f |+0.50f |+1.00f |
            tilop_y    |tilop_1|tilop_1|tilop_1|tilop_1|tilop_1|
                |      |(-100%)|(-50%) |(  0% )|(+50%) |(+100%)|
                V      +-------+-------+-------+-------+-------+
        --- +-------+  +-------+-------+-------+-------+-------+
            |-1.00f |  |       |       |       |       |       |
        0/4 |tilop_1|  |   0   |       |       |       |       |
            |(-100%)|  |fraic_L|       |       |       |       |
        --- +-------+  +-------+-------+-------+-------+-------+
            |-0.50f |  |       |       |       |       |       |
        1/4 |tilop_1|  |       |   1   |       |       |       |
            |(-50%) |  |       |fraic_L|       |       |       |
        --- +-------+  +-------+-------+-------+-------+-------+
            | 0.00f |  |       |       |       |       |       |
        2/4 |tilop_1|  |       |       |   2   |       |       |
            |(  0% )|  |       |       |fraic_L|       |       |
        --- +-------+  +-------+-------+-------+-------+-------+
            |+0.50f |  |       |       |       |       |       |
        3/4 |tilop_1|  |       |       |       |   3   |       |
            |(+50%) |  |       |       |       |fraic_L|       |
        --- +-------+  +-------+-------+-------+-------+-------+
            |+1.00f |  |       |       |       |       |       |
        4/4 |tilop_1|  |       |       |       |       |   4   |
            |(+100%)|  |       |       |       |       |fraic_L|
        --- +-------+  +-------+-------+-------+-------+-------+

            [ ( ( 0/4 ) * 2.0 ) - 1.0 ]==> -1.0
            [ ( ( 1/4 ) * 2.0 ) - 1.0 ]==> -0.5
            [ ( ( 2/4 ) * 2.0 ) - 1.0 ]==>  0.0
            [ ( ( 3/4 ) * 2.0 ) - 1.0 ]==> +0.5
            [ ( ( 4/4 ) * 2.0 ) - 1.0 ]==> +1.0
            #_DIA_TILOPER_CALC_TABLE_#

            //:------------------------------:TILOPER_DIAGRAM://
            //:1X1_INPUT:------------------------------------://
            
            +---+
            |1x1| <-- p5d_vp1 viewport.
            +---+     #_CLUDMAP_1X1_INPUT_#

            //:------------------------------------:1X1_INPUT://
            //:VP0_OUTPUT_MAPPINGS:--------------------------://
            @VID_IID[ 0260 ]TIME[ 01:08:23 ]ALIAS_ARTIFACTING
            @VID_IID[ 0260 ]TIME[ 01:19:19 ]FINAL_EXPLANATION
            @VID_IID[ 0260 ]TIME[ 01:52:13 ]RED_EARTH_ANALOGY

            +---+
            |0.0| <---------- p5d_vp0 , 1 pixel(s) wide.       
            +---+             PIXEL[ 0 ]==>( tilop_x ==  0.0 )

            +---+---+
            |-1.|+1.| <------ p5d_vp0 , 2 pixel(s) wide.
            +---+---+         PIXEL[ 0 ]==>( tilop_x == -1.0 )
                              PIXEL[ 1 ]==>( tilop_x == +1.0 )

            +---+---+---+
            |-1.|0.0|+1.| <-- p5d_vp0 , 3 pixel(s) wide
            +---+---+---+     PIXEL[ 0 ]==>( tilop_x == -1.0 )
            ^     ^     ^     PIXEL[ 1 ]==>( tilop_x ==  0.0 )
            |     |     |     PIXEL[ 2 ]==>( tilop_x == +1.0 )
            +-----+-----+
                  |
            [  tiloper   ]( tiloper:TIle_LOcal_PERcentage )
            [  tilop_x   ]
                [ tilop_x == 0.0 ]
                    |          
                    V          
            +---+---+---+---+ PIXEL[ 0 ]==>( tilop_x == -1.0 )
            |-1.|-.3|+.3|+1.| PIXEL[ 1 ]==>( tilop_x == -0.3 )
            +---+---+---+---+ PIXEL[ 2 ]==>( tilop_x == +0.3 )
            |25%|25%|25%|25%| PIXEL[ 3 ]==>( tilop_x == +1.0 )
            [ ( ( 0/3 ) * 2.0 ) - 1.0 ]==> -1.0
            [ ( ( 1/3 ) * 2.0 ) - 1.0 ]==> -0.3
            [ ( ( 2/3 ) * 2.0 ) - 1.0 ]==> +0.3
            [ ( ( 3/3 ) * 2.0 ) - 1.0 ]==> +1.0

            ROUGH_FORMULA:
               percent = ( pixel_x / ( width_in_pixels - 1 ) )
 
            //:--------------------------:VP0_OUTPUT_MAPPINGS://
            //:PROBLEM_NORMALIZATION:------------------------://
            /** @VID_IID[ 0260 ]TIME[ 03:53:00 ]RE_EXPLAINED **/
                
                [ ][ ]       <-- vp1_san
                [ ][ ][ ][ ] <-- vp0_san
                vp0_nom==( vp0_san / vp1_san );       [ ]
                vp0_nom==(    4    /    2    )==( 2 ) [ ][ ]
               

                [ ][ ]             <-- vp1_san
                [ ][ ][ ][ ][ ][ ] <-- vp0_san
                vp0_nom==( vp0_san / vp1_san );       [ ]
                vp0_nom==(    6    /    2    )==( 3 ) [ ][ ][ ]
                
                [ ][ ][ ] <----------- vp1_san
                [ ][ ][ ][ ][ ][ ] <-- vp0_san
                vp0_nom==( vp0_san / vp1_san );       [ ]
                vp0_nom==(    6    /    3    )==( 2 ) [ ][ ]

            //:------------------------:PROBLEM_NORMALIZATION://

        //:=========================:SOLVE_IT_1_DIMENSIONALLY://
        //:SOLVE_WITH_1D_RANGES:=============================://
        
            //:1x1_TILE_TO_PIXELS_BUT_VP0_IS_OFFSET:---------://
            
                |<------------ 256 ------------>|
                +---+---+---+---+---+---+---+---+    (  tiles  )
                |   |   |   |   |   |   |   |   | <--[ p5d_vp1 ]
                +---+---+---+---+---+---+---+---+ 

                |<---- 128 ---->|
                +---+---+---+---+
                | 0 |   |   |127| @_NO_OFFSET_APPLIED_@
                +---+---+---+---+
                                |<---- 128 ---->|
                                +---+---+---+---+
                                |128|   |   |255| @_SAME_PHASE_@
                                +---+---+---+---+

            //:---------:1x1_TILE_TO_PIXELS_BUT_VP0_IS_OFFSET://
            //:Smaller_Range_Of_Values:----------------------://
            /** Still 1:1 mapping between tiles and pixels   **/
            /** @VID_IID[ 0263 ]T[ 04:42:32 ]FIXING_IT_UP    **/
            /** #_VP1_010_VP0_005_#                          **/

            YOU_DONT_KNOW_WHAT_YOU_ARE_DOING....:

                |<-------------- p5d_vp1 -------------->|
                |<---------------- 010 ---------------->|
                |<-------vp1:LEF--->|<------ vp1:RIG -->|
                |<------ 005 ------>|<------ 005 ------>|
                +---+---+---+---+---+---+---+---+---+---+  
                | 0 |   | 2 |   | 4 | 5 |   | 7 |   | 9 |  
                +---+---+---+---+---+---+---+---+---+---+ 
        DES_OUT[ -1      0.0     +1  -1      0.0     +1 ]

                |<---- p5d_vp0 ---->|
                |<------ 005 ------>|
                +---+---+---+---+---+
                | 0 |   | 2 |   | 4 | 
                +---+---+---+---+---+
                                    |<------ 005 ------>|
                                    +---+---+---+---+---+
                                    | 5 |   | 7 |   | 9 |  
                                    +---+---+---+---+---+
                                    |<---- p5d_vp0 ---->|

 
            //:----------------------:Smaller_Range_Of_Values://
            //:ZOOM_ON_IN_ON_CELL_2:-------------------------://
            /** @VID_IID[ 0263 ]TIME[ 04:58:23 ]EXPLAINED ** **/
            //: #_ZOOM_123_TEST_#

                If input range for[ vp1 ]is[ 1 -to- 3 ]
                we should expect outputs to be between
                [ -0.5 ]and[ +0.5 ]with[ 0.0 ]in the center.
                ...i think...

                clu_san ==(  5  );

                    |<-- vp1 -->| ( p5d_vp1 == [ 1 -to- 3 ] )
                    +-----------+
                    |-.5     +.5|
                +---+---+---+---+---+  +---+---+---+---+---+  
                | 0 | 1 | 2 | 3 | 4 |  | 5 |   | 7 |   | 9 | 
                +---+---+---+---+---+  +---+---+---+---+---+ 
        DES_OUT[ -1 |    0.0    | +1    -1      0.0     +1 ]
                    +-----------+

                |<---- p5d_vp0 ---->|( p5d_vp0 == [ 1 -to- 5 ] )
                |<------ 005 ------>|
                +---+---+---+---+---+
                | * | 1 | 2 | 3 | * | 
                +---+---+---+---+---+
                     /    |    \
                  -0.5   0.0  +0.5

                I got this test to pass but uncertain if
                I have the correct math....

                Looking at it... I think this math is correct.
                If[ p5d_vp1 ]was 1 pixel larger on each side
            &&  If[ p5d_vp1 ]was 1 pixel larger on each side
            ,   look at how the mapping would still check out.

            //:-------------------------:ZOOM_ON_IN_ON_CELL_2://
            //:BACKSHIFTING_PROPORTIONALLY:------------------://

                We need to backshift[ vp1_san ]'s left bound
                until it hits [0]. Then we need to
                backshift[ vp0_san ]'s left bound backwards
                by the same PROPORTIONAL amount.
                In current diagram there is a 1:1 proportion
                between offscreen data tiles( vp1_san )
                to on screen pixels( vp0_san ), so 
                in this EXCEPTION, we just have to shift
                backwards by identical amounts on both
                [ vp1_san ]and[ vp0_san ]

            THIS: - - - - - - - - - - - - - - - - - - - - - - -:
                clu_san==[ 2 ] 
                | 01 || 02 || 03 |
                [0][1][2][3][4][5] <--[ vp1_san == 2 ]
                      |    |
                      |    |
                      [2][3] <--------[ vp0_san == 2 ]
                      vp1 ==[ 2 -to- 3 ]
                      vp0 ==[ 2 -to- 3 ]
                      f_1 ==[ 2   &  3 ]
        
            BECOMES: - - - - - - - - - - - - - - - - - - - - - :
                clu_san==[ 2 ] 
                | 01 || 02 || 03 |
                [0][1][2][3][4][5] <--[ vp1_san == 2 ]
                |          |
                |          |
                [0][1][2][3] <--------[ vp0_san == 2 ]
                      vp1 ==[ 0 -to- 3 ]
                      vp0 ==[ 0 -to- 3 ]
                      f_1 ==[ 2   &  3 ] <-- unchanged.

            //:------------------:BACKSHIFTING_PROPORTIONALLY://


        //:=============================:SOLVE_WITH_1D_RANGES://
        //:STILL_SOLVING_WITH_1D_RANGES:=====================://
    ////////////////////////////////////////////////////////////


    [      01      ][      02      ] <--[ clu_san ]
    [00][01][02][03][04][05][06][07] <--[ vp1_san ][ num_peb ]
    |              |               |
    |  +-----------+               |
    |  |                           |
    |  |   +-----------------------+
    |  |   |
    [00][01] <--------------------------[ vp0_san ][ num_pix ]
     ^^  \\
     ||   PIXEL_B(01)
    PIXEL_A(00)

    How do we get same results for [01] when[ vp0 ]is no
    longer origined at[ 0,0 ] ?
    
        AAC2020_P5D1OGL_CludMap_ZOF_1_D(
            [ 00 | 01 ] <-- fraic_1 
        ,   (    2    ) <-- vp0_san  
        ,   (    8    ) <-- vp1_san  
        ,   (    4    ) <-- clu_san ( 4 pebbles per tile )
        );;

    If we wanted to just map[ PIXEL_B ]using[ CludMap_RNG_1_D ]
    how would we do that? Format the call below, then figure
    out the internal math.

        AAC2020_P5D1OGL_CludMap_RNG_1_D(
            01 <-- fraic_1 //:[ fic.x | fic.y ]/(fraic_x|fraic_y)

                   //: range only covers 1 pixel here.
        ,    1 <-- vp0_b_0 //:AKA[ vp0_min ]( x_0 | y_0 )
        ,    1 <-- vp0_b_1 //:AKA[ vp0_max ]( x_1 | y_1 )

                   //: mapping to offscreen[ pebbles/tiles ]
                   //:[ 4 - 7 ]which should be clustered to
                   //:be interpeted as a single tile.
        ,    4 <-- vp1_b_0 //:AKA[ vp1_min ]( x_0 | y_0 ) 
        ,    7 <-- vp1_b_1 //:AKA[ vp1_max ]( x_1 | y_1 ) 

                   //:pretty sure cluster size sould remain
                   //:un-changed.
        ,    4 <-- clu_san //:Clustering_Of_vp0_units
        );;

    FIRST_THOUGHT:
    I think the answer is to widen [ vp0_san ]and[ vp1_san ]
    by proportional amounts by pulling back on their lower
    bounds until[ vp1_san ]is origined at[ 0,0 ].
    This will preserve the correct phases for clustering
    of internal tile coordinates derived from tiles that are 
    are greater than 1 pebble in size.

    2ND_THOUGHT:FIRST_THOUGHT_WAS_CLOSE:
    We only need to widen[ vp1_san ](offscreen data)
    until it hits the origin. [ vp0_san ](on screen pixels)
    will end up whatever it needs to be based on proportionally
    scaling with[ vp1_san ].


    ////////////////////////////////////////////////////////////
        //:STILL_SOLVING_WITH_1D_RANGES:=====================://

    //:||||||||||||||||||||||||||||||||:DIAGRAMS:CLUDMAP(ing)://
    //:DIAGRAMS:FAT_32_TILES:||||||||||||||||||||||||||||||||://

        //:fat32_tiles_vocabulary:---------------------------://

            AMCASET: AMmo_CAn_SET
                     A type of [AUSET]that is drawn with
                     our[ FAT_32 ]TILES.

            ZER_CON: Zero Config.
                     The zero tile slot will be used to store
                     configuration information for tileset 
                     rather than actual tileset data.

            BITBUL4: Literally[ BIT BULLET 4 ]
                    ( 4[cells/bullets]   )

                     One of the 4 bits within a BITMAG4.
                     Each BITBUL4 is a binary digit determining
                     if a tile is turned on or off.

            BITMAG4: Literally[ BIT MAGazine ]
                     ( 4[stacks/magazines])

            AMCAN32: Literally[ AMmo_CANister_32 ]
                     (32 of them. They are the data sets that)
                     (create 1 tile design in FAT_32_TILES)

        //:---------------------------:fat32_tiles_vocabulary://
        //:deprecated_terms:---------------------------------://

            BITCEL4 (Bit  Cell)==> BITBUL4 (bit bullet  )
            BITPIL4 (Bit  Pill)==> BITBUL4 (bit bullet  )

            BITSTA4 (Bit Stack)==> BITMAG4 (bit magazine)
            BITTOW4 (Bit Tower)==> BITMAG4 (bit magazine)

            BLOK128 (Bit Block)==> AMCAN32 (32 ammo cans )
            AMMOCAN (Ammo Can )==> AMCAN32 (32 ammo cans )

        //:---------------------------------:deprecated_terms://

        Originally I was thinking a 4X4X4 cube of data where
        you have a total of 64 tiles.But going from 16 ausets
        in the[ @TERMINAL_TILES@ (Paint5D) ]to 64 tiles seems
        a bit too steep of an increase. ALSO...
        4 layers of data for each tileset here seems better
        to work with. We could do things like:


            STEP_001: Alpha Blend the 4 BITBUL4 tiles
                      to create a BITMAG4.

            STEP_002: Alpha blend togeher all BITMAG4(s)
                      Each[ BULLET/TILE ]in a BITMAG4 
                      has a 25% influence over the final 
                      output.
               
                      This creates a AMCAN32.
                      (AMCAN32 == Ammo Can , 32 of them )

        |<------------ 512 ------------>|
        |<-128->|<-128->|<-128->|064|064|
        +-------+-------+-------+---+---+ 
        |       |       |       |   |   | \
        |   0   |   1   |   2   +---3---+  \
        |ZER_CON|       |       |   |   |   \
        +-------+-------+-------+---+---+    +
        |       |       |       |       |    |
        |   4   |   5   |   6   |   7   |    |
        |       |       |       |       |    |
        +-------+-------+-------+-------+    +--[TOP_OF_CUBE]
        |       |       |       |       |    |
        |   8   |   9   |  10   |  11   |    |
        |       |       |       |       |    |
        +-------+-------+-------+-------+    +
        |       |       |       |       |   /
        |  12   |  13   |  14   |  15   |  /
        |       |       |       |       | /
        +===============================+  +---+---+ +---=---+
        |       |       |       |       |  | 1 | 5 | |009|013|
        |AMCAN32|AMCAN32|AMCAN32|AMCAN32|  | 2 | 6 | |010|014|
        |  12   |  13   |  14   |  15   |  | 3 | 7 | |011|015|
        |       |       |       |       |  | 4 | 8 | |012|016|
        +---=---+---=---+---=---+---=---+  +-------+ +---=---+
        |       |       |       |       |  |017|021| |025|029|
        |AMCAN32|AMCAN32|AMCAN32|AMCAN32|  |018|022| |026|030|
        |  28   |  29   |  30   |  31   |  |019|023| |027|031|
        |       |       |       |       |  |020|024| |028|032|
        +---=---+---=---+---=---+---=---+  +---=---+ +---=---+
                                             ^
                                             |
                        +----------------> +-------+
                        |  32 Ammo Cans    |017|021|
           [AMCAN32]____|  (128x128)tile   |018|022|
                        |  non-terminal    |019|023|
                        |  AUSETS          |020|024|
                        +----------------> +-------+
                                             ^
                                             |
                        +----------------> +---+ =--+--=
                        |   BITBUL4 -----> |017|    |
           [BITMAG4]____|   BITBUL4 -----> |018| BITMAG4
                        |   BITBUL4 -----> |019|    |
                        |   BITBUL4 -----> |020|    |
                        +----------------> +---+ =--+--=

    //:||||||||||||||||||||||||||||||||:DIAGRAMS:FAT_32_TILES://
    //:DIAGRAMS:AUTOMIX:|||||||||||||||||||||||||||||||||||||://
    //:DIAGRAMS:AUTOLAT:|||||||||||||||||||||||||||||||||||||://
    @VID_IID[ 0275 ]TIME[ 02:11:42 ]EXPLAINING_THIS_SECTION

        AUTOMIX: AUTOmatic MIXing   (of tiles)
        AUTOLAT: AUTOmatic LATching (of tiles)

        --------------------------------------------------------
        BOTH_USING_SAME_AUTOMIX_WITH_EACH_OTHER

        +---+---+---+---+---+---+
        |           |           |
        +   +   +   +   +   +   +  AYE == No Action
        |    AYE    |    BEE    |  BEE == No Action
        +   +   +   +   +   +   +
        |           |           |
        +---+---+---+---+---+---+

        +---+---+--+ +--+---+---+
        |       ___| |___       |
        +   +  |         |  +   +  AYE == AUTOMIX==DIVOTS
        |    AYE         BEE    |  BEE == AUTOMIX==DIVOTS
        +   +  |         |  +   +
        |       ¯¯¯| |¯¯¯       |
        +---+---+--+ +--+---+---+
    
        +---+---+---+---+---+---+
        |           |           |
        +   +   +===+===+   +   +  AYE == AUTOMIX==PRONGS
        |    AYE|||||||||BEE    |  BEE == AUTOMIX==PRONGS
        +   +   +===+===+   +   +  ( 50/50 alpha blend overlap )
        |           |           |  @VID_IID[0275]T[02:47:32]
        +---+---+---+---+---+---+
        --------------------------------------------------------
        +---+---+---+---+---+---+
        |           |           |
        +   +   +   +===+   +   +  AYE == AUTOMIX==PRONGS
        |    AYE        |BEE    |  BEE == No Action
        +   +   +   +===+   +   +
        |           |           |
        +---+---+---+---+---+---+

        +---+---+---+---+---+---+
        |           |           |
        +   +   +===+   +   +   +  AYE == No Action
        |    AYE|       |BEE    |  BEE == AUTOMIX==PRONGS
        +   +   +===+   +   +   +
        |           |           |
        +---+---+---+---+---+---+
        --------------------------------------------------------
        +---+---+---++--+---+---+
        |           ||___       |
        +   +   +   +===+|  +   +  AYE == AUTOMIX==PRONGS
        |    AYE        |BEE    |  BEE == AUTOMIX==DIVOTS
        +   +   +   +===+|  +   +
        |           ||¯¯¯       |
        +---+---+---++--+---+---+

        +---+---+--++---+---+---+
        |       ___||           |
        +   +  |+===+   +   +   +  AYE == AUTOMIX==DIVOTS
        |    AYE|       |BEE    |  BEE == AUTOMIX==PRONGS
        +   +  |+===+   +   +   +
        |       ¯¯¯||           |
        +---+---+--++---+---+---+
        --------------------------------------------------------

        When two tile types get close to each other, they
        can interact with each other and change how they
        render themselves. This makes the environment
        look more intentionally "put together".
        
        Not sure which word I will settle on [AUTOMIX|AUTOLAT].
        But the idea is that it is[ LIKE ]auto tiling but
        determines how 1 tile will interact with another
        tile when in proximity to another tile.

        Background Material Tiles: (B_#:Material  B)
        [ B_1 , B_2 , B_3 , B_4 , B_5 , B_6 , B_7 , B_8 ]

        Foreground Material Tiles: (F_#:Material  F)
        [ F_1 , F_2 , F_3 , F_4 ]

        Tangent Material Tiles:    (T_#:Material  T)

        +---+---+---+---+---+---+---+---+---+ <---+
        |           |           |           |     |
        +   +   +   +   +   +   +   +   +   +     |
        |    B_1    |    B_2    |    B_3    |     |
        +   +   +   +   +   +   +   +   +   +     |
        |           |           |           |     |
        +---+---+---+---+---+---+---+---+---+     |
        |           |           |           |     |
        +   +   +   +   +   +   +   +   +   +     |
        |    B_4    |    B_5    |    B_6    |     +--[3x3_TILES]
        +   +   +   +   +   +   +   +   +   +     |
        |           |           |           |     |
        +---+---+---+---+---+---+---+---+---+     |
        |           |           |           |     |
        +   +   +   +   +   +   +   +   +   +     |
        |    B_7    |    B_8    |    B_9    |     |
        +   +   +   +   +   +   +   +   +   +     |
        |           |           |           |     |
        +-----------+-----------+-----------+ <---+


        +---+---+---+---+---+---+---+---+---+
        |           |           |           |
        +   +   +   +   +---+   +   +   +   +
        |           |   | S |   |           |
        +   +   +   +   +   +   +   +   +   +
        |           |   |   |   |           |
        +---+---+---+---+   +---+---+---+---+ SURROUNDED:
        |           |           |           | [B_6]detects[F_1]
        +   +---+---+   +   +   +---+---+   + and renders prongs
        |   |B_F         F_1         B_F|   | [B_F]of material
        +   +---+---+   +   +   +---+---+   + type[ F ].
        |           |    B_5    |    B_6    |
        +---+---+---+ - - - - - +---+---+---+ INNER_TANGENT:
        |           |           |           | [B_9] detects[F_2]
        +   +   + +-+   +   +   +-+ +   +   + and renders 
        |         |B_F   F_2   B_F|  B_9    | prongs[B_F]of
        +   +   + +-+   +   +   +-+ +   +   + material type[ F ]
        |           |           |           |
        +-----------+---+   +---+-----------+   
                    |+--|   |--+|     +------------------------+
                    ||  +   +  ||     [ OUTER_TANGENT ]:       |
                    ||  |T_F|  || <-- [ T_1 ]tile detects      |
                    ||  +---+  ||     |      adjacent[ F_2 ]   |
                    ||   T_1   ||     |      tile.             |
                    +|--+---+--|+     |                        |
                    ||         ||     |    [F_2]tile is _NOT_  |
                    ||         ||     |    set here. But[T_1]  |
                    ||   T_2   ||     |    renders[F_2]tile as |
                    ||         ||     |    if it [GREW/SNAPPED]|
                    ||_________||     |    into[ T_1 ]         |
                    +-----------+     |                        |
                                      |    This creates:       |
                                      |    PRONG_T( T_F )      |
                                      |    T == CURRENT___MAT  |
                                      |    F == PULLED_IN_MAT  |
                                      |(MAT==Material)         |
                                      +------------------------+

        SURROUNDED:
            AUTOMIXING that happens when current tile
            detect's an adjacent tile (TOP|LEF|RIG|BOT)
            where it's material type is 100% surrounding
            another tile type. The other tile type can then
            be[ pulled into ]the current tile to create
            automatic latching effects.
            ( By convention, BIGGER latches than INNER_TANGENT )

        INNER_TANGENT:
            Like[ SURROUNDED ]but the[ other_tile ]is less than
            100% surrounded. But the[ other_tile ]__IS__
            overlapping the current tile type.

        OUTER_TANGENT:
            The current tile detects another tile type as
            its[ TOP | LEF | RIG | BOT ]neighbor, but
            there is NO OVERLAP between the two tile types
            on the current tile cell being rendered.


    //:|||||||||||||||||||||||||||||||||||||:DIAGRAMS:AUTOMIX://
    //:|||||||||||||||||||||||||||||||||||||:DIAGRAMS:AUTOLAT://
    //:DIAGRAMS:DAMAGED_SPACE_TILES:|||||||||||||||||||||||||://
    @VID_IID[ 0275 ]TIME[ 03:00:42 ]EXPLAINED_FOR_VIEWER
    @VID_IID[ 0275 ]TIME[ 03:04:04 ]DONE_EXPLAINING_TO_VIEWER

        //:vocab_section:------------------------------------://

            DAMSPAT: DAMaged_SPAce_Tile  
                    The hidden tile used as a damage mask
                    that tells us.
        
                    1. What tiles to __NOT__ render because
                       they have been blown up.

                    2. What tiles to render with damage effects
                       because they TANGENT a[ DAMSPAT ].
        
            DAMTILE: DAMaged_TILE
                    The actual tile that is rendering damage
                    effects because it TANGENTS a[ DAMSPAT ]

        //:------------------------------------:vocab_section://

        Instead of having only _ONE_ type of [ ZERO ]tile...
        We could have a whole map of different kinds of
        [ ZERO ] tiles.

        These tiles are used as a mask to tell us[ HOW ]
        parts of the level were destroyed.

        For example:
            A tile[ deleted/destroyed ] by a [ FIRE_BOMB ] 
            may leave a different type of graphic behind 
            than a tile[ deleted/destroyed ]by 
            an[ ELECTRIC_BOMB ].

            ELECTRIC_DAMAGE_TILE: 
                Might leave MELTED EDGE EFFECTS on
                tiles adjacent to it's overlap site.

            FIRE_____DAMAGE_TILE:
                Might leave CHARRED BURNT COAL EFFECTS
                on tiles adjacent to it's overlap site.


            Two bombs go off with a square blast radius
            on this 7x7 chunk of tiles:

            +---+---+---+---+---+---+---+
            |   |   |ELE|ELE|ELE|   |   |
            +---+---+---+---+---+---+---+
            |   |   |ELE|ELE|ELE|   |   |
            +---+---+---+---+---+---+---+
            |   |   |ELE|ELE|ELE|   |   |
            +---+---+---+---+---+---+---+
            |   |   |   |   |   |   |   |
            +---+---+---+---+---+---+---+
            |   |   |FIR|FIR|FIR|   |   |
            +---+---+---+---+---+---+---+
            |   |   |FIR|FIR|FIR|   |   |
            +---+---+---+---+---+---+---+
            |   |   |FIR|FIR|FIR|   |   |
            +---+---+---+---+---+---+---+

            @VID_IID[ 0275 ]TIME[ 02:59:13 ]
            The 3X3 blocks of[ ELE ]and[ FIR ] tiles
            STILL_EXIST below, but are not visible
            to the player of the game. They are what
            control what damage effects show up.

            +---+---+           +---+---+
            |   |_M_|           |_M_|   | _M_ : Melted effects
            +---+---+           +---+---+       on these tiles.
            |   |_M_|           |_M_|   |
            +---+---+           +---+---+
            |   |_M_|           |_M_|   |
            +---+---+---+---+---+---+---+
            |   |DAM|DAM|DAM|DAM|DAM|   | DAM : Combined 
            +---+---+---+---+---+---+---+       damage effects.
            |   |_C_|           |_C_|   |
            +---+---+           +---+---+
            |   |_C_|           |_C_|   | _C_ : Chared effects
            +---+---+           +---+---+       on these tiles.
            |   |_C_|           |_C_|   |
            +---+---+           +---+---+

    //:|||||||||||||||||||||||||:DIAGRAMS:DAMAGED_SPACE_TILES://
    //:=============================================:DIAGRAMS://
    //:DIAGRAMS_UN_OFFICIAL:=================================://
    //:DIAGRAMS:PIPELINED_512_X_512_DATASETS:||||||||||||||||://

        THIS_IS_NOT_OFFICIAL. JUST_A_ROUGH_IDEA.
        Thinking that each time we create a non-terminal
        auto tile set, it should have some other feature that
        gives it a new behavior.

        Structure the pipeline in a sensible way so that
        the workflow is fun and exciting.

        Arrow denotes the flow of data. 
        What feeds into what.
     
                  +---+
                  |P5D| Terminal Auto Tiles (PAINT5D Editor)
                  +---+
                    |
                    V
                  +---+
                  |FAT| 64 Fractal Auto Tiles
          +---+---+---+---+---+
          |                   |  
          V                   V
        +---+               +---+ Decals:
        |LAM| 128           |DEC| 32 positive (addative  )
        +---+               +---+ 32 negative (sutractive)
        
        LAM: "Latch And Mix" tiles.
        Uses "Automixing" / "AutoLatching"
        Which tells us how a tile should modify
        itself when overlapping or next to 
        another tile.
         
        ---------------------------------------------------
        With fractal auto tiling? How will we decide where
        do draw the line between a tileset and a level map?
        ---------------------------------------------------

            @_NOT_OFFICIAL_JUST_A_ROUGH_THOUGHT_@
            How to combine different maps together into
            the final level.

            BAS: Base  Level maps
            DEM: Decal  Map (addative+subtractive)
            CUG: Composite_Undamaged_Geometry(map)
            DAM: Damage Map (using damage tiles)
            FIN: Final Level Map

            +---+
            |BAS|----+
            +---+    |   +---+
                     +---|CUG|---+
            +---+    |   +---+   |
            |DEM|----+           |   +---+
            +---+                +---|FIN|
                                 |   +---+
                         +---+   |
                         |DAM|---+ 
                         +---+

    //:||||||||||||||||:DIAGRAMS:PIPELINED_512_X_512_DATASETS://
    //:=================================:DIAGRAMS_UN_OFFICIAL://
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
    //:ASCII_VALUES_IN_128_TO_255_RANGE:=====================://

        magicaros: back in old MS DOS i would spend useless 
        time to frame thing with "╔═╦╗║╝╩..." and oh hell i 
        still remember the Alt+[ascii code] for it

    //:=====================:ASCII_VALUES_IN_128_TO_255_RANGE://
    
    
    
    
    
    
    
    