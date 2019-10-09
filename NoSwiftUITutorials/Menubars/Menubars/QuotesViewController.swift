//
//  QuotesViewController.swift
//  Menubars
//
//  Created by sudo.park on 09/10/2019.
//  Copyright © 2019 kakao. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    
    @IBOutlet weak var textLabel: NSTextField!
    
    private let quotes = Quote.dummies
    
    private var cursor: Int = 0 {
        didSet {
            let quote = quotes[cursor]
            self.textLabel.stringValue = "\(quote)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        textLabel.allowsEditingTextAttributes = false
        textLabel.isEditable = false
        cursor = 0
    }
    @IBAction func previous(_ sender: Any) {
        cursor = (cursor - 1) % quotes.count
    }
    
    @IBAction func next(_ sender: Any) {
        cursor = (cursor + 1) % quotes.count
    }
    
    @IBAction func quit(_ sender: Any) {
        NSApplication.shared.terminate(nil)
    }
    
}



extension QuotesViewController {
    
    static var instance: QuotesViewController {
        
        let storyBoard = NSStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = storyBoard.instantiateController(withIdentifier: "QuotesViewController") as? QuotesViewController else {
            fatalError("fail to load viewController from storyboard")
        }
        
        return viewController
        
    }
}
