//
//  ViewController.swift
//  P4_GridBrowser
//
//  Created by ParkHyunsoo on 2019/10/30.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Cocoa
import WebKit


class ViewController: NSViewController {
    
    private var rows: NSStackView = {
        let view = NSStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.orientation = .vertical
        view.distribution = .fillEqually
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(rows)
        NSLayoutConstraint.activate([
            rows.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            rows.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            rows.topAnchor.constraint(equalTo: self.view.topAnchor),
            rows.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let column = NSStackView(views: [makeWebView()])
        column.translatesAutoresizingMaskIntoConstraints = false
        column.distribution = .fillEqually
        
        rows.addArrangedSubview(column)
    }
    
    @IBAction func adjustNavigation(_ sender: NSSegmentedControl) {
    }
    
    @IBAction func adjustRows(_ sender: NSSegmentedControl) {
    }
    
    
    @IBAction func adjustColumns(_ sender: NSSegmentedControl) {
        
        if sender.selectedSegment == 0 {
            for case let row as NSStackView in self.rows.arrangedSubviews {
                row.addArrangedSubview(makeWebView())
            }
        }else{
            
            guard let firstRow = self.rows.arrangedSubviews.first as? NSStackView,
                firstRow.arrangedSubviews.count > 1 else {
                    return
            }
            
            for case let row as NSStackView in self.rows.arrangedSubviews {
                if let last = row.arrangedSubviews.last {
                    row.removeArrangedSubview(last)
                    last.removeFromSuperview()
                }
            }
        }
    }
    @IBAction func urlEntered(_ sender: NSTextField) {
    }
    
    
    
    @IBOutlet weak var urlEntry: NSTextField!
    
    
}


extension ViewController: WKNavigationDelegate {
    
    private func makeWebView() -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = self
        // webView에 CA적용
        webView.wantsLayer = true
        
        let request = URLRequest(url: URL(string: "https://www.apple.com")!)
        webView.load(request)
        return webView
    }
}
