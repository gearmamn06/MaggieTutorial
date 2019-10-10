//
//  ChatMessage.swift
//  FakeTalkMacApp
//
//  Created by ParkHyunsoo on 2019/10/11.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Foundation


struct FeedMessage {
    
    enum ContentType {
        case date
        case invited
        case leave
    }
    
    let message: String
    let highlighted: String
}

struct ImageMessageInfo {
    
    let name: String
    let size: Int
    let width: Float
    let height: Float
    let url: String
}

struct FileMessageInfo {

    // 파일 타입은 이미지 띄울때 어짜피 준비된 이미지만 띄울수 있으니깐 view 쪽에서 suffix 보고 판단하는게 용이
    let name: String
    let size: Int
    let downloadableUntil: Date?
    let url: String
}

struct EmoticonInfo {
    
    let id: String
    let name: String
    let description: String
    let url: String
}

struct ChatMessage {
    
    enum Content {
        case feed(_ message: FeedMessage)
        case text(_ value: String)
        case longText(_ value: String, url: String)
        case images(_ info: ImageMessageInfo)
        case file(_ info: FileMessageInfo)
        case emoticon(_ info: EmoticonInfo)
    }
    
    enum SendingStatus {
        case pending
        case sending(_ progress: Float)
        case fail(_ error: Error?)
        case sent
    }
    
    let sequenceID: String?
    let roomID: String
    let senderID: String
    let sendTime: Int
    
    let content: Content
    var sendingStatus: SendingStatus
}
