/***************************************************************
 * Name:      testMain.h
 * Purpose:   Defines Application Frame
 * Author:     ()
 * Created:   2023-12-01
 * Copyright:  ()
 * License:
 **************************************************************/

#ifndef TESTMAIN_H
#define TESTMAIN_H



#include "testApp.h"


#include "GUIFrame.h"

class testFrame: public GUIFrame
{
    public:
        testFrame(wxFrame *frame);
        ~testFrame();
    private:
        virtual void OnClose(wxCloseEvent& event);
        virtual void OnQuit(wxCommandEvent& event);
        virtual void OnAbout(wxCommandEvent& event);
};

#endif // TESTMAIN_H
