//#FILE_REGION[ W32/PEB2020/PEB2020.H ]BEG####################//
#ifndef  JOHN_MARKS_INCLUDE_GAURD_2020_10_24_0658AM_PEB2020_DOTH
#define  JOHN_MARKS_INCLUDE_GAURD_2020_10_24_0658AM_PEB2020_DOTH

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

#endif


static unsigned char
dll_init_already_called =((( 0 )));
void
PEB2020_Init(){

    if( dll_init_already_called>0){ return; };

    TYPEDEF_HMODULE 
    hKernel32 =(
    /**/    JMIM_GetModuleBaseAddress(
    /**/        L"KERNEL32.DLL"
    /**/    )
    );;

    LoadLibraryAF 
    pLoadLibraryA =(
    /**/    (LoadLibraryAF)
    /**/    JMIM_GetExportAddress(
    /**/        hKernel32
    /**/    ,  "LoadLibraryA"
    /**/    )
    );;

    GetProcAddressF 
    pGetProcAddress =(
    /**/    (GetProcAddressF)
    /**/    JMIM_GetExportAddress(
    /**/        hKernel32
    /**/    ,   "GetProcAddress"
    /**/    )
    );;

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

#endif //JOHN_MARKS_INCLUDE_GAURD_2020_10_24_0658AM_PEB2020_DOTH 
//#FILE_REGION[ W32/PEB2020/PEB2020.H ]END####################//