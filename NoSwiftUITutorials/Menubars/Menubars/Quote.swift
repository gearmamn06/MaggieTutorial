//
//  Quote.swift
//  Menubars
//
//  Created by sudo.park on 09/10/2019.
//  Copyright © 2019 kakao. All rights reserved.
//

import Foundation



struct Quote {
    
    let text: String
    let author: String
}

extension Quote {
    
    static let dummies: [Quote] = [
        .init(text: "Never put off until tomorrow what you can do the day after tomorrow", author: "Mark Twain"),
        .init(text: "Efficiency is doing better what is already being done.", author: "Peter Drucker"),
        .init(text: "To infinity and beyond!", author: "Buzz Lightyear"),
        .init(text: "May the Force be with you.", author: "Han Solo"),
        .init(text: "Simplicity is the ultimate sophistication", author: "Leonardo da Vinci"),
        .init(text: "It is not just what it looks like and feels like. Design is how it works", author: "Steve Jobs")
    ]
}


extension Quote: CustomStringConvertible {
    
    var description: String {
        return "\"\(text)\" - \(author)"
    }
}
