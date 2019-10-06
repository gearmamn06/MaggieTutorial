//
//  PreferenceViewModel.swift
//  NoSwiftUI
//
//  Created by ParkHyunsoo on 2019/10/06.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Foundation

import RxSwift

final class PreferenceViewModel {
    
    enum RecomendedBoildTime {
        
        case min3
        case min4
        case min6
        case min10
        case min15
        case custom(_ time: Int)
        
        var id: Int {
            switch self {
            case .min3: return 3
            case .min4: return 4
            case .min6: return 6
            case .min10: return 10
            case .min15: return 15
            case .custom: return -1
            }
        }
        
        var duration: TimeInterval {
            switch self {
            case let .custom(time): return Double(time) * 60
            default: return Double(id) * 60
            }
        }
        
        static func from(id: Int, customDuration: Int = 6) -> RecomendedBoildTime? {
            switch id {
            case 3: return .min3
            case 4: return .min4
            case 6: return .min6
            case 10: return .min10
            case 15: return .min15
            case -1: return .custom(customDuration)
            default: return nil
            }
        }
    }
    
    private let selectedTime = BehaviorSubject<RecomendedBoildTime>(value: .min6)
    
    private var dataSource: [RecomendedBoildTime] = [
        .min3,.min4, .min6, .min10, .min15, .custom(6)
    ]
    
    init() {
        let nsu = UserDefaults.standard
        
        let id = nsu.value(forKey: "id") as? Int ?? 6
        let customTime = nsu.value(forKey: "customTime") as? Int ?? 6
        
        let time = RecomendedBoildTime.from(id: id, customDuration: customTime) ?? .min6
        selectedTime.onNext(time)
    }
}


extension PreferenceViewModel {
    
    func choosePopupItem(_ index: Int) {
        
        if index == 6 {
            selectedTime.onNext(dataSource.last!)
            return 
        }
        
        guard index < dataSource.count else { return }
        
        let time = dataSource[index]
        selectedTime.onNext(time)
    }
    
    func customTimeSliderValueChanegd(_ value: Int) {
        let newValue = RecomendedBoildTime.custom(value)
        self.dataSource[self.dataSource.count-1] = newValue
        self.selectedTime.onNext(newValue)
    }
    
    func save() {
        guard let value = try? self.selectedTime.value() else { return }
        
        let nsu = UserDefaults.standard
        nsu.setValue(value.id, forKey: "id")
        switch value {
        case let .custom(time):
            nsu.setValue(time, forKey: "customTime")
            
        default: break
        }
        nsu.synchronize()
        
        // 컴포넌트간 notification으로 통신(다중 윈도우 환경)
        let duration = value.duration
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "duration_changed"),
                                        object: nil, userInfo: ["value": duration])
    }
}


extension PreferenceViewModel {
    
    var isSliderEnabled: Observable<Bool> {
        return selectedTime
            .map{
                if case .custom = $0 {
                    return true
                }
                return false
            }
    }
    
    var customSliderSelectedTimeString: Observable<String> {
        return selectedTime
            .compactMap { type -> String? in
                switch type {
                case let .custom(time):
                    return "\(time) minute(s)"
                    
                default: return nil
                }
            }
    }
}
