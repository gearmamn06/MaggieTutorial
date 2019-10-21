//
//  DetailViewController.swift
//  P1_StormViewer
//
//  Created by ParkHyunsoo on 2019/10/22.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name: String) {
        imageView.image = NSImage(named: name)
    }
}
