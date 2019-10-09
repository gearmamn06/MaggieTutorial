//
//  AppDelegate.swift
//  Menubars
//
//  Created by sudo.park on 09/10/2019.
//  Copyright © 2019 kakao. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // statusItem -> Application Icon
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    let popover = NSPopover()
    
    private var eventMonitor: EventMonitor?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = #imageLiteral(resourceName: "StatusBarButtonImage")
            button.action = #selector(togglePopOver(_:))
        }
//        buildMenu()
        popover.contentViewController = QuotesViewController.instance
        
        setupEventMonitor()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}


// MARK: status bar button action -> menu

extension AppDelegate {
    
    private func buildMenu() {
        
        let menu = NSMenu()
        // keyEquivalent: 단축키, 소문자: cmd + , 대문자: cmd + shift +
        // 단축키는 앱이 맨위에 있을때만 작동됨
        menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(printQuote(_:)), keyEquivalent: "p"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(quitQuotes(_:)), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    
    
    @objc private func printQuote(_ sender: Any) {
        let quoteText = "Never put off nutil tomorrow what you can do the day after tomorrow"
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) - \(quoteAuthor)")
    }
    
    @objc private func quitQuotes(_ sender: Any) {
        
    }
}



// MARK: show popover controller

extension AppDelegate {
    
    @objc private func togglePopOver(_ sender: Any) {
        if popover.isShown {
            closePopover(sender: sender)
        }else{
            showPopover(sender: sender)
        }
    }
    
    private func showPopover(sender: Any?) {
        if let button = statusItem.button {
            // you just need to supply a source rect and macOS will position the popover and arrows so it looks like it's coming out of the menu bar icon.
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            
            eventMonitor?.start()
        }
    }
    
    private func closePopover(sender: Any) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
}


// MARK: setup event monitor

extension AppDelegate {
    
    func setupEventMonitor() {
        
        // first reponseder가 앱에 있으면 여기로 이벤트 전달 안됨?
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            
            guard let self = self, self.popover.isShown else {
                return
            }
            self.closePopover(sender: event)
        }
    }
}
