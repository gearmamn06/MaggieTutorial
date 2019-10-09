//
//  EventMonitor.swift
//  Menubars
//
//  Created by sudo.park on 09/10/2019.
//  Copyright © 2019 kakao. All rights reserved.
//

import Cocoa


public class EventMonitor {
    
    private var monitor: Any?
    private let mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> Void
    
    
    public init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> Void) {
        // 생성자를 통하여 어떤 이벤트를 구독할지에 대한 정보를 담은 mask와 callback을 받을 handler를 전달함
        self.mask = mask
        self.handler = handler
    }
    
    
    deinit {
        stop()
    }
}



// MARK: EventMonitoring Interface

extension EventMonitor {
    
    
    public func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }
    
    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
