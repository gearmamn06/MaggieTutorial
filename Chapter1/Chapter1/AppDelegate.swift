//
//  AppDelegate.swift
//  Chapter1
//
//  Created by ParkHyunsoo on 2019/10/04.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    
    /*
     StyleMask: These constants specify the style of a window, and can be combined using the C bitwise OR operator.
     - titled: 타이틀바 보여줌 여부
     - closable: 닫기 버튼
     - miniaturizable: 최소화 버튼(노란색)
     - resizable: 윈도우 크기 리사이즈 가능 여부
     - fullSizeContentView: 풀스크린 여부(초록색 버튼)
     - fullScreen: 뭔소리인줄 몰겄음.. 타이틀은 보여짐, 더블클릭시 전체화면 x, 최소화 x
        The window can appear full screen. A fullscreen window does not draw its title bar, and may have special handling for its toolbar. (This mask is automatically toggled when toggleFullScreen(_:) is called.)
     */
    
    /*
     NSWindow.BackingStoreType: These constants specify how the drawing done in a window is buffered by the window device.
     -> 디스플레이할때 버퍼 말하는거같음
     - buffered: 버퍼이용
     - 나머지는 디프리케이트
     */


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.title = "Chapter1 - Stacks"
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
        // NSHostingView: An AppKit view that hosts a SwiftUI view hierarchy.
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        //edit
    }


}

