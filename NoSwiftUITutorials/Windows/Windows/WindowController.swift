//
//  WindowController.swift
//  WIndows
//
//  Created by ParkHyunsoo on 2019/10/10.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // 해당 플래그 on시 새로운 윈도우가 이전 윈도우 바로 위가 아니라 계단식으로 쌓임
        shouldCascadeWindows = true
    }

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
        // 해당 플래그 on시 새로운 윈도우가 아니라 새 탭이 생김
        self.window?.tabbingMode = .preferred
        
        if let window = window, let screen = window.screen {
            // 스크린 좌 상단 기준 100, 100 포인트 기준으로 윈도우 띄울꺼임
            let offsetFromLeft: CGFloat = 100
            let offsetFromTop: CGFloat = 100
            
            // visibleFrame -> dock, menu 제거 이후 보여질 수 있는 프레임
            // ** 멀티윈도우 환경에서는 현재 포커스 맞춰진 윈도우 위치 + 크기정보 포함
            let screenRect = screen.visibleFrame
            // window.frame은 보여질 윈도우 사이즈 정보를 포함
            let newOriginY = screenRect.maxY - window.frame.height - offsetFromTop
            
            window.setFrameOrigin(NSPoint(x: offsetFromLeft, y: newOriginY))
        }
    }

}
