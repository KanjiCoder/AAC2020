//#FILE_REGION[ W32/PEB2020/PEB2020.H ]BEG####################//
#ifndef  JOHN_MARKS_INCLUDE_GAURD_2020_10_24_0658AM_PEB2020_DOTH
#define  JOHN_MARKS_INCLUDE_GAURD_2020_10_24_0658AM_PEB2020_DOTH

/** NOTE: CUT+PASTED FROM: "A3" PROJECT ON: **/
/** DATE: 2022_01_26                        **/

//[ PEB2020: PEB2020_Loader                                  ]//
//+----------------------------------------------------------+//
//| PUBLIC:                                                  |//
//| PEB2020_FUNC                                             |//
//| PEB2020_DLIB                                             |//
//| PEB2020_WRAP_LoadLibraryA                                |//
//| PEB2020_WRAP_GetProcAddress                              |//
//+----------------------------------------------------------+//

//:ONE_AND_ONLY_ONE_SHOULD_BE_SET_TO_ONE:====================://

    //: This code was originally in a "configuration" file   ://
    //: called  [ "DLLL.COMSET" / "PEB2020.COMSET" ].        ://
    //: Decided to put here to keep library simpler.         ://
    //: Tradeoff being less flexibility.                     ://

    #define COMPILE_FOR_windows_10_64bit 1

//:====================:ONE_AND_ONLY_ONE_SHOULD_BE_SET_TO_ONE://

#if( COMPILE_FOR_windows_10_64bit >= 1 )

    #include "TARG/W10.X64"

    typedef
        TYPEDEF_HMODULE
        PEB2020_DLIB;

    typedef 
        TYPEDEF_FARPROC 
        PEB2020_FUNC;

    //:ADDED_DATE[ 2022_01_16 ]@VID_IID[ 0345 ]TIME[ 04:43:13 ]
    typedef    void  ( PEB2020_GEN )( void );
    typedef    void* ( PEB2020_G00 )(      );
    typedef int32_t  ( PEB2020_GI3 )(      );     

#endif

//:ADDED:2021_06_25:To_Fix_Implicit_Type_Conversion_Errors:
typedef 
     void
    (__stdcall PEB2020_GENERIC_FUNCTION )
    ( void );

static unsigned char
dll_init_already_called =((( 0 )));
void
PEB2020_Init(){

    if( dll_init_already_called>0){ return; };
    
    //:2021_06_25:Declare First to help me find bugs in
    //:current compilation.
    TYPEDEF_HMODULE hKernel32 =((TYPEDEF_HMODULE)0);
    LoadLibraryAF pLoadLibraryA =((LoadLibraryAF)0);
    GetProcAddressF pGetProcAddress =((GetProcAddressF)0);

    hKernel32 =(
    /**/    JMIM_GetModuleBaseAddress(
    /**/        L"KERNEL32.DLL"
    /**/    )
    );;

    //:HACK:2021_06_25:FIXING_CASTING_ERRORS:
    TYPEDEF_FARPROC  tmp_lla;
    tmp_lla=(
    /**/    (TYPEDEF_FARPROC )
    /**/    JMIM_GetExportAddress(
    /**/        hKernel32
    /**/    ,  "LoadLibraryA"
    /**/    )
    );;
    pLoadLibraryA =((LoadLibraryAF)
    (PEB2020_GENERIC_FUNCTION*)tmp_lla);

    
    //:HACK:2021_06_25:FIXING_CASTING_ERRORS:
    TYPEDEF_FARPROC  tmp_gpa;
    tmp_gpa=(
    /**/    (TYPEDEF_FARPROC )
    /**/    JMIM_GetExportAddress(
    /**/        hKernel32
    /**/    ,   "GetProcAddress"
    /**/    )
    );;
    pGetProcAddress =((GetProcAddressF)
    (PEB2020_GENERIC_FUNCTION*)tmp_gpa);

    //:Assign the private function pointers
    //:defined in the specific operating system
    //:implementation files:
    dll_LoadLibraryA   =pLoadLibraryA  ;
    dll_GetProcAddress =pGetProcAddress;

    dll_init_already_called=( 1 );
    
}//[;]//

PEB2020_DLIB
PEB2020_WRAP_LoadLibraryA(
    const char* name
){
    //- printf("[WLLA...]\n");fflush(stdout); -//

    if(NULL==dll_LoadLibraryA){
        printf("[FORGOT:PEB2020_Init()?](LLA)\n");
        assert(NULL!=dll_LoadLibraryA);
    };;

    //:Implementation_Specific:
    return( dll_LoadLibraryA( name ) );
}//[;]//

PEB2020_FUNC
PEB2020_WRAP_GetProcAddress(
    PEB2020_DLIB   dlib
,   const char* name
){
    //- printf("[WGPA...]\n");fflush(stdout); -//

    if(NULL==dll_GetProcAddress){
        printf("[FORGOT:PEB2020_Init()?](GPA)\n");
        assert(NULL!=dll_GetProcAddress);
    };;

    //:Implementation_Specific:
    PEB2020_FUNC ret;
    ret = (PEB2020_FUNC)
           dll_GetProcAddress(dlib, name);
    return(  ret  );
}//[;]//

//|==========================================================|//
//|  Let's be real... You are not going to                   |//
//|  remember "PEB2020_WRAP_*" Better just stick             |//
//|  with habits that are less complex.                      |//
//+----------------------------------------------------------+//               
//|  Also,prioritize ease of use! Not speed                  |//
//|  here.                                                   |//
//|==========================================================|//

PEB2020_DLIB
PEB2020_LoadLibraryA(
    const char* name
){
    //- printf("[LLA...]\n"); fflush(stdout); -//

    PEB2020_Init(); //:LazyInit

    PEB2020_DLIB ret=(
    /**/    PEB2020_WRAP_LoadLibraryA(
    /**/        name
    /**/    )
    );;

    if(NULL==ret){
        printf(
            "[PEB2020_LoadLibraryA:FAIL]:%s\n"
        ,   name
        );;
        fflush(stdout); //:So_We_Can_See_What_Went_Wrong
    };;

    return( ret );

}//[;]//

PEB2020_FUNC
PEB2020_GetProcAddress(
    PEB2020_DLIB   dlib
,   const char* name
){
    //- printf("[GPA...]\n");fflush(stdout); -//

    PEB2020_Init(); //:LazyInit

    PEB2020_FUNC ret=(
    /**/    PEB2020_WRAP_GetProcAddress(
    /**/        dlib
    /**/    ,   name
    /**/    )
    );;

    #define MACRO_PEB2020_H_fail_fast 1 ///////////////////////////
    if(NULL==ret){
        printf(
            "((([FILE:PEB2020.H][PEB2020_GetProcAddress:FAIL]))):%s\n"
        ,   name
        );;

        fflush(stdout);

        if( MACRO_PEB2020_H_fail_fast != 0 ){
            exit(666);
        };;
    };;
    #undef  MACRO_PEB2020_H_fail_fast /////////////////////////////


    return( ret );

}//[;]//


int 
PEB2020_LibraryDemo()
{

    PEB2020_DLIB  hUser32    ; /** DLL Library  Reference **/
    PEB2020_FUNC  pMessageBox; /** GPA Function Pointer   **/

    hUser32 = PEB2020_LoadLibraryA("user32.dll");

    pMessageBox=(
    PEB2020_GetProcAddress( hUser32, "MessageBoxW")
    );;

    pMessageBox(
    /**/NULL
    ,   L"It works!"
    ,   L"Hello World!"
    ,   MACRO_WINDOWS_xxx_MB_OK
    );;

	return 0;

}


//:NEW_CODE_2022_01_16:======================================://
#define GEN PEB2020_GEN
#define G00 PEB2020_G00
#define GI3 PEB2020_GI3
#define ERR peb2020_err

    void
    peb2020_err( const char* msg ){
        printf( "[peb2020_err]:%s\n" , msg );
        fflush( stdout );
        exit( 23 );
    }

    //:@VID_IID[ 345 ]TIME[ 04:39:00 ]

    ////////////////////////////////////////////////////////////

    //:Code to get the function type casting to not
    //:throw warnings in gcc.

    ////////////////////////////////////////////////////////////

    //: GEN: A true generic function pointer type.
    //:      I should have used this the entire time,
    //:      but I had thought that generic function
    //:      type of:   void MYFUNC( void );
    //:      was meerly a convention. It is __NOT__.
        
        GEN* 
        PEB2020_WRAP_GetProcAddress_GEN(
            PEB2020_DLIB   dlib
        ,   const char* name
        ){
            if(NULL==dlib){ ERR("[NILLIB:GEN]"); };
            if(NULL==dll_GetProcAddress){
                printf("[PEB2020:GPA:GEN]\n");
                assert(NULL!=dll_GetProcAddress);
            };;

            //:DANGEROUS_CODE:SEE[ DANGERCODE_2022 ]
            PEB2020_FUNC hak = dll_GetProcAddress(dlib, name);
            GEN* ret =( ((GEN*)0) );
            memcpy( &ret , &hak , sizeof( int* ) );

            if( 0 == hak || 0 == ret ){
                printf("[cant_get_func]:%s\n" , name );
            };;
            if( 0 == hak ){ ERR( "[NILHAK:GEN]" ); };
            if( 0 == ret ){ ERR( "[NILRET:GEN]" ); };
            return(  ret  );
        }

        GEN*
        PEB2020_GetProcAddress_GEN(
            PEB2020_DLIB   dlib
        ,   const    char* name
        ){
            PEB2020_Init(); //:LazyInit

            GEN* ret=( PEB2020_WRAP_GetProcAddress_GEN(
            /**/        dlib
            /**/    ,   name
            /**/    )
            );;

            #define MACRO_FAIL_FAST 1 //////////////////////////
            if(NULL==ret){
                printf( "[OH_NO:2022_01_16:GEN]:%s" , name );
                fflush(stdout);
                if( MACRO_FAIL_FAST != 0 ){ exit(666); };
            };;
            #undef  MACRO_FAIL_FAST ////////////////////////////

            return( ret );
        }

    ////////////////////////////////////////////////////////////

    //: G00: Undefined number of arguments and
    //:      Returning Void.

        
        G00* 
        PEB2020_WRAP_GetProcAddress_G00(
            PEB2020_DLIB   dlib
        ,   const char* name
        ){

            if(NULL==dlib){ ERR("[NILLIB:G00]"); };
            if(NULL==dll_GetProcAddress){
                printf("[PEB2020:GPA:G00]\n");
                assert(NULL!=dll_GetProcAddress);
            };;

            //:DANGEROUS_CODE:SEE[ DANGERCODE_2022 ]
            PEB2020_FUNC hak = dll_GetProcAddress(dlib, name);
            G00* ret =( ((G00*)0) );
            memcpy( &ret , &hak , sizeof( int* ) );

            if( 0 == hak || 0 == ret ){
                printf("[cant_get_func]:%s\n" , name );
            };;
            if( 0 == hak ){ ERR( "[NILHAK:G00]" ); };
            if( 0 == ret ){ ERR( "[NILRET:G00]" ); };
            return(  ret  );
        }

        G00*
        PEB2020_GetProcAddress_G00(
            PEB2020_DLIB   dlib
        ,   const    char* name
        ){
            PEB2020_Init(); //:LazyInit

            G00* ret=( PEB2020_WRAP_GetProcAddress_G00(
            /**/        dlib
            /**/    ,   name
            /**/    )
            );;

            #define MACRO_FAIL_FAST 1 //////////////////////////
            if(NULL==ret){
                printf( "[OH_NO:2022_01_16:G00]:%s" , name );
                fflush(stdout);
                if( MACRO_FAIL_FAST != 0 ){ exit(666); };
            };;
            #undef  MACRO_FAIL_FAST ////////////////////////////

            return( ret );
        }

    ////////////////////////////////////////////////////////////

    //: GI3: Undefined number of arguments and
    //:      Returning I32.

        GI3*
        PEB2020_WRAP_GetProcAddress_GI3(
            PEB2020_DLIB   dlib
        ,   const char*    name
        ){

            if(NULL==dll_GetProcAddress){
                printf("[PEB2020:GPA:GI3]\n");
                assert(NULL!=dll_GetProcAddress);
            };;

            //:DANGEROUS_CODE:SEE[ DANGERCODE_2022 ]
            PEB2020_FUNC hak = dll_GetProcAddress(dlib, name);
            GI3* ret =( ((GI3*)0) );
            memcpy( &ret , &hak , sizeof( int* ) );
            return(  ret  );
        }

        GI3*
        PEB2020_GetProcAddress_GI3(
            PEB2020_DLIB   dlib
        ,   const    char* name
        ){
            PEB2020_Init(); //:LazyInit

            GI3* ret=(
            /**/    PEB2020_WRAP_GetProcAddress_GI3(
            /**/        dlib
            /**/    ,   name
            /**/    )
            );;

            #define MACRO_FAIL_FAST 1 //////////////////////////
            if(NULL==ret){
                printf( "[OH_NO:2022_01_16:GI3]:%s" , name );
                fflush(stdout);
                if( MACRO_FAIL_FAST != 0 ){ exit(666); };
            };;
            #undef  MACRO_FAIL_FAST ////////////////////////////

            return( ret );
        }

    ////////////////////////////////////////////////////////////

#undef  GEN
#undef  G00  
#undef  GI3  
#undef  ERR
//:======================================:NEW_CODE_2022_01_16://


#endif //JOHN_MARKS_INCLUDE_GAURD_2020_10_24_0658AM_PEB2020_DOTH 
//#FILE_REGION[ W32/PEB2020/PEB2020.H ]END####################//