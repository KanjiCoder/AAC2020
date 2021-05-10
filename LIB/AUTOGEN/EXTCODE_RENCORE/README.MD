
    //:SUMMARY:==============================================://

        1. DONT_USE_THIS_FOLDER 
        2. TRY_LOOKING_IN:
            2.1: "/LIB/AUTOGEN/<EDITOR_NAME>"
            2.2: "<SOMEWHERE>/RENCORE_OR_EXTCODE._"
            
    //:==============================================:SUMMARY://
    //:CURRENT_VALID_NOTES:==================================://

        See how this file works:
        AAC2020/LIB/MOR_PAINT5D/RENCORE_OR_EXTCODE._

        I think the idea of using[ THIS FOLDER ]
        ( LIB/AUTOGEN/EXTCODE_RENCORE )
        Is a __MISTAKE__.

        It is too deeply nested. Group extensions based on
        the system they override. Even if that means that
        multiple extension types [ RENCORE & __WHATEVER__ ]
        end up copied to the same folder.

        @VID_IID[0285]TIME[02:36:50]EXPLAINED
 
    //:==================================:CURRENT_VALID_NOTES://
    //:OLD_NOTES_DISREGARD:==================================://

        Any extension code used to edit the[ RENCORE ]functions
        of different editor sub systems goes in this folder.

        RENCORE means: "RENderer CORE"
                       As in "core render functions"

        Render core functions exist so that we have ways for
        people to simply interface with the engine without
        being overloaded by all of it's complexities.

        You can get started easily just by overriding a single
        [RENCORE] function. For example, maybe a blendmode
        function.

        @VID_IID[0285]TIME[02:22:22]DATE[2021_05_03:132PM]

    //:==================================:OLD_NOTES_DISREGARD://