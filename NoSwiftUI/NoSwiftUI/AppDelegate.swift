//
//  AppDelegate.swift
//  NoSwiftUI
//
//  Created by ParkHyunsoo on 2019/10/05.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    @IBOutlet weak var stratTimerMenuItem: NSMenuItem!
    @IBOutlet weak var stopTimerMenuItem: NSMenuItem!
    @IBOutlet weak var resetTimerMenuItem: NSMenuItem!
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        stratTimerMenuItem.isEnabled = true
        stopTimerMenuItem.isEnabled = false
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

