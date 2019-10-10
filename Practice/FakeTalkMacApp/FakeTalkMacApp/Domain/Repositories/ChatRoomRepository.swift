//
//  ChatRoomRepository.swift
//  FakeTalkMacApp
//
//  Created by ParkHyunsoo on 2019/10/11.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Foundation

import RxSwift


protocol ChatRoomRepository {
    
    func loadAll(userID: String, responseCallback: (Result<[ChatRoom], Error>) -> Void)
    
    // 나머지는 나중에 필요시 구현..
//    func mute(on: Bool, roomID: String, responseCallback: (Result<Bool, Error>) -> Void)
//
//    func leave(userID: String, roomID: String, responseCallback: (Result<Bool, Error>) -> Void)
//
//    func changeRoomName(to newName: String, roomID: String, responsecallback: (Result<Bool, Error>) -> Void)
    
}


class ChatRoomRespoitoryRxImple: ChatRoomRepository {
    
    func loadAll(userID: String, responseCallback: (Result<[ChatRoom], Error>) -> Void) {
        // TODO: Load whole dummies chatRooms
    }
    
    
    func loadAll(userID: String) -> Single<[ChatRoom]> {
        return Single.create { [weak self] emitter in
            
            guard let self = self else {
                fatalError()
            }
            
            self.loadAll(userID: userID) { result in
                switch result {
                case let .success(rooms):
                    emitter(.success(rooms))
                    
                case let .failure(error):
                    emitter(.error(error))
                }
            }
            
            return Disposables.create()
        }
        .delay(.seconds(1), scheduler: MainScheduler.instance)
    }
}
