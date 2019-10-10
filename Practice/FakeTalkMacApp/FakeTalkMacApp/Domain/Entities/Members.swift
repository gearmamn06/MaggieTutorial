//
//  Members.swift
//  FakeTalkMacApp
//
//  Created by ParkHyunsoo on 2019/10/11.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Foundation



struct Member {
    
    let userID: String
    
    var name: String
    
    let isMe: Bool
}


extension Member {
    
    static let me = Member(userID: "uid_me", name: "나다", isMe: true)
    
    static var dummies: [Member] {
        let names = ["홍길동", "김철수", "이철수", "홍철수", "왕비홍", "아무개", "이명희", "개구리", "오징어"]
        return names.enumerated().map {
            return Member(userID: "uid_\($0.offset)", name: $0.element, isMe: false)
        }
    }
}
