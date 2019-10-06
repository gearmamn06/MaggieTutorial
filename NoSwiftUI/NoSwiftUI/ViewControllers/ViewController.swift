//
//  ViewController.swift
//  NoSwiftUI
//
//  Created by ParkHyunsoo on 2019/10/05.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

/*
 storyboard
    - Application Scene: menu bar
    - Window Controller Scene: window behavior, resize, appear, save size and location
    - View Controller Scene: display userinterface inside window
 
 ** In macOS programming, you have to deal with an infinite variety of window sizes and aspect ratios
 */

import Cocoa

import RxSwift
import RxCocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var timeRemainLabel: NSTextField!
    @IBOutlet weak var eggImageView: NSImageView!
    @IBOutlet weak var startButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var resetButton: NSButton!
    
    
    private let viewModel = ViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        subscribeTimer()
        subscribeButtonEvents()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    // MARK: IBActions - menus
    // First Responder와 연결되어있음 -> 해당뷰가 front에 있다면 메뉴 클릭시에 이벤트 전달
    
    @IBAction func startTimerMenuItemSselected(_ sender: Any) {
        self.viewModel.start()
    }
    
    @IBAction func stopTimerMenuItemSelected(_ sender: Any) {
        self.viewModel.stop()
    }
    
    @IBAction func resetTimerMenuItemSelected(_ sender: Any) {
        self.viewModel.reset()
    }
    
    
}


// MARK: bind

extension ViewController {
    
    private func subscribeButtonEvents() {
        self.startButton.rx.tap.asDriver()
            .drive(onNext: { [weak self] in
                self?.viewModel.start()
            })
            .disposed(by: self.disposeBag)
        
        self.stopButton.rx.tap.asDriver()
            .drive(onNext: { [weak self] in
                self?.viewModel.stop()
            })
            .disposed(by: self.disposeBag)
        
        self.resetButton.rx.tap.asDriver()
            .drive(onNext: { [weak self] in
                self?.viewModel.reset()
            })
            .disposed(by: self.disposeBag)
    }
    
    private func subscribeTimer() {
        
        self.viewModel.remainTime
            .map { $0.timeString }
            .debug("remainTime")
            .bind(to: self.timeRemainLabel.rx.text)
            .disposed(by: disposeBag)
        
        self.viewModel.eggImageName
            .map {
                NSImage(named: $0)
            }
            .bind(to: self.eggImageView.rx.image)
            .disposed(by: self.disposeBag)
        
        self.viewModel.isStartButtonEnabled
            .subscribe(onNext: { [weak self] enabled in
                self?.startButton.isEnabled = enabled
                (NSApplication.shared.delegate as! AppDelegate).stratTimerMenuItem.isEnabled = enabled
            })
            .disposed(by: self.disposeBag)
        
        self.viewModel.isStopButtonEnabled
            .subscribe(onNext: { [weak self] enabled in
                self?.stopButton.isEnabled = enabled
                (NSApplication.shared.delegate as! AppDelegate).stopTimerMenuItem.isEnabled = enabled
            })
            .disposed(by: self.disposeBag)
    }
}



fileprivate extension TimeInterval {
    
    var timeString: String {
        let int = Int(self)
        let min = int / 60
        let sec = int % 60
        return "\(min):\(String(format: "%02d", sec))"
    }
}
