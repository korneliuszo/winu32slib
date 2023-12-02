/***************************************************************
 * Name:      testApp.cpp
 * Purpose:   Code for Application Class
 * Author:     ()
 * Created:   2023-12-01
 * Copyright:  ()
 * License:
 **************************************************************/

#ifdef WX_PRECOMP
#include "wx_pch.h"
#endif

#ifdef __BORLANDC__
#pragma hdrstop
#endif //__BORLANDC__

#include "testApp.h"
#include "testMain.h"

IMPLEMENT_APP(testApp);

bool testApp::OnInit()
{
    testFrame* frame = new testFrame(0L);
    frame->SetIcon(wxICON(aaaa)); // To Set App Icon
    frame->Show();
    
    return true;
}
