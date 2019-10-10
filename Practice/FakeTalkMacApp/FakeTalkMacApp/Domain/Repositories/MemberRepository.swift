//
//  MemberUsecase.swift
//  FakeTalkMacApp
//
//  Created by ParkHyunsoo on 2019/10/11.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Foundation

import RxSwift

protocol MemberRepository {
    
    func loadAll(userID: String, responseCallback: @escaping (Result<[Member], Error>) -> Void)
}


class MemberRepositoryRxImple: MemberRepository {
    
    
    func loadAll(userID: String, responseCallback: (Result<[Member], Error>) -> Void) {
        
        let dummies = Member.dummies
        responseCallback(.success(dummies))
    }
    
    
    func loadAll(userID: String) -> Single<[Member]> {
        return Single.create { [weak self] emitter in
            
            guard let self = self else {
                fatalError()
            }
            
            self.loadAll(userID: userID) { result in
                switch result {
                case let .success(members):
                    emitter(.success(members))
                    
                case let .failure(error):
                    emitter(.error(error))
                }
            }
            
            return Disposables.create()
        }
        .delay(.seconds(1), scheduler: MainScheduler.instance)
    }
}
