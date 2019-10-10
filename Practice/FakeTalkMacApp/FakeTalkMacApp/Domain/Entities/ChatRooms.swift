//
//  ChatRooms.swift
//  FakeTalkMacApp
//
//  Created by ParkHyunsoo on 2019/10/11.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Foundation


// MARK: stored properties

struct ChatRoom {
    
    let roomID: String
    
    var name: String
    
    var memberIDs: [String]
    
    var lastChat: ChatMessage?
}
