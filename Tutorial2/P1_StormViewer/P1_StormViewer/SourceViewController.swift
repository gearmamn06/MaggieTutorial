//
//  SourceViewController.swift
//  P1_StormViewer
//
//  Created by ParkHyunsoo on 2019/10/22.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    private var pictures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        items.forEach { item in
            if item.hasPrefix("img") {
                self.pictures.append(item)
            }
        }
        
        setupTableView()
    }
    
}

// MARK: - NSTableView Datasource & Delegate

extension SourceViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    private func setupTableView() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    // 이 메소드를 쓰면 리유스 안됨
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        // 하지만 makeView에 reuse identifier 입력시 reuse 가능한 뷰가 반환됨
        guard let view = tableView.makeView(withIdentifier: tableColumn!.identifier,
                                            owner: self) as? NSTableCellView else {
                                                return nil
        }
        view.textField?.stringValue = pictures[row]
        return view
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1,
            let splitViewController = parent as? NSSplitViewController,
            let detailViewController = splitViewController.children.last
                as? DetailViewController else {
                return
        }
        
        detailViewController.imageSelected(name: pictures[tableView.selectedRow])
    }
}
