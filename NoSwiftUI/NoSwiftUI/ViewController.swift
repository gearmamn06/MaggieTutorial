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

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

