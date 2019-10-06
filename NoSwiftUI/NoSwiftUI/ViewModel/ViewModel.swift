//
//  EggTimer.swift
//  NoSwiftUI
//
//  Created by ParkHyunsoo on 2019/10/06.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Foundation

import RxSwift

final class ViewModel {
    
    enum Status {
        case idle
        case paused(_ remain: TimeInterval)
        case running(_ remain: TimeInterval)
    }
    
    private var duration: TimeInterval = 6 * 60
//    private var elapseTime: TimeInterval = 0
    
    private let currentStatus = BehaviorSubject<Status>(value: .idle)
    private var timerRunning: Disposable?
}


// MARK: interactor

extension ViewModel {
    
    private func runTimer(forWhile: TimeInterval) {
        let endTime = Date().addingTimeInterval(forWhile)
        timerRunning?.dispose()
        timerRunning = Observable<Int>
            .interval(.seconds(1), scheduler: MainScheduler.instance)
            .startWith(0)
            .map { _ in
                return endTime.timeIntervalSince(Date())
            }
            .do(onNext: { [weak self] remain in
                if remain < 0 {
                    self?.timerRunning?.dispose()
                    self?.currentStatus.onNext(.idle)
                }
            })
            .filter{ $0 >= 0}
            .map{ Status.running($0) }
            .bind(to: currentStatus)
    }
    
    func start() {
        guard let value = try? currentStatus.value() else { return }
        switch value {
        case .idle:
            runTimer(forWhile: self.duration)
            
        case let .paused(remain):
            runTimer(forWhile: remain)
            
        default: break
        }
    }
    
    func stop() {
        guard let value = try? currentStatus.value() else { return }
        switch value {
        case let .running(remain):
            timerRunning?.dispose()
            self.currentStatus.onNext(.paused(remain))
            
        default: break
        }
    }
    
    func reset() {
        self.timerRunning?.dispose()
        self.currentStatus.onNext(.idle)
    }
}


// MARK: presenter

extension ViewModel {
    
    var remainTime: Observable<TimeInterval> {
        return currentStatus
            .compactMap { [weak self] status -> TimeInterval? in
                guard let self = self else { return nil }
                switch status {
                case .idle:
                    return self.duration
                    
                case let .paused(remain):
                    return remain
                    
                case let .running(remain):
                    return remain
                }
            }
            .share()
    }
    
    var eggImageName: Observable<String> {
        return currentStatus
            .compactMap { [weak self] status -> String? in
                guard let duration = self?.duration else { return nil }
                
                let remain: TimeInterval
                switch status {
                case .idle: return "stopped"
                case let .paused(value): remain = value
                case let .running(value): remain = value
                }
                
                let percent = remain / duration
                switch percent {
                case 0..<25: return "0"
                case 25..<50: return "25"
                case 50..<75: return "50"
                case 75..<100: return "75"
                default: return "100"
                }
            }
    }
    
    var isStartButtonEnabled: Observable<Bool> {
        return currentStatus
            .map {
                switch $0 {
                case .idle, .paused:
                    return true
                default: return false
                }
            }
    }
    
    var isStopButtonEnabled: Observable<Bool> {
        return currentStatus
            .map {
                switch $0 {
                case .running: return true
                default: return false
                }
        }
    }
}


