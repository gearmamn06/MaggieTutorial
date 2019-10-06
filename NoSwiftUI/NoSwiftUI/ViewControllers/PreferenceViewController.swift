//
//  PreferenceViewController.swift
//  NoSwiftUI
//
//  Created by ParkHyunsoo on 2019/10/05.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Cocoa

import RxSwift

class PreferenceViewController: NSViewController {
    
    @IBOutlet weak var timeSelectPopup: NSPopUpButton!
    @IBOutlet weak var currentSelectedTimeLabel: NSTextField!
    @IBOutlet weak var customBoilTimeSlider: NSSlider!
    @IBOutlet weak var cancelButton: NSButton!
    @IBOutlet weak var okButton: NSButton!
    
    private let disposeBag = DisposeBag()
    private let viewModel = PreferenceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        self.customBoilTimeSlider.rx.value.asDriver()
            .skip(1)
            .drive(onNext: { [weak self] _ in
                if let intValue = self?.customBoilTimeSlider.integerValue {
                    self?.viewModel.customTimeSliderValueChanegd(intValue)
                }
            })
            .disposed(by: self.disposeBag)
        
        self.viewModel.customSliderSelectedTimeString
            .bind(to: currentSelectedTimeLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        self.viewModel.isSliderEnabled
            .bind(to: customBoilTimeSlider.rx.isEnabled)
            .disposed(by: self.disposeBag)
        
        self.okButton.rx.tap.asDriver()
            .drive(onNext: { [weak self] in
                self?.viewModel.save()
            })
            .disposed(by: self.disposeBag)
    }
    
    @IBAction func popupSelectionchanged(_ sender: Any) {
        // MARK: index 값으로 불러올시 sperator도 포함 -> tag 붙이는게 그나마 깔끔..
        let index = timeSelectPopup.indexOfSelectedItem
        viewModel.choosePopupItem(index)
    }
}
