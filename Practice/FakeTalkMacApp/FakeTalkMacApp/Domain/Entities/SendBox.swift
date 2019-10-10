//
//  AlertSetting.swift
//  FakeTalkMacApp
//
//  Created by ParkHyunsoo on 2019/10/11.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Foundation


// 로컬에서만 저장해서 관리한다 가정

struct SendBox {
    
    var isMute: Bool = false
    
    private var mutedRoomMap: [String: Bool] = [:]
}


// MARK: Computed properties

extension SendBox {
    
    func isMutedRoom(_ roomID: String) -> Bool {
        return mutedRoomMap[roomID] ?? false
    }
}
