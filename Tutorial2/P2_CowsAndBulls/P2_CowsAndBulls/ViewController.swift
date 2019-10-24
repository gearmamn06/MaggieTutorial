//
//  ViewController.swift
//  P2_CowsAndBulls
//
//  Created by ParkHyunsoo on 2019/10/24.
//  Copyright © 2019 ParkHyunsoo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var guess: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    private var answer = ""
    private var guesses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startANewGame()
        
        tableView.tableColumns.first?.title = "Guess"
        tableView.tableColumns.last?.title = "Result"
    }
    
    @IBAction func submitGuess(_ sender: Any) {
        let input = self.guess.stringValue
        if Set(input).count == 4 {
            self.guesses.insert(input, at: 0)
            self.guess.stringValue = ""
            
            self.tableView.insertRows(at: IndexSet(integer: 0), withAnimation: .slideDown)
        }
    }
}


// MARK: Game logic

extension ViewController {
    
    private func startANewGame() {
        self.guess.stringValue = ""
        self.guesses.removeAll()
        self.answer = generateRandomAnswer()
        
        self.tableView.reloadData()
    }
    
    private func generateRandomAnswer() -> String {
        return (0..<4)
            .map{ _ in Int.random(in: 0..<9) }
            .reduce("", { str, v in
                return "\(str)\(v)"
            })
        
    }
    
    private func result(for input: String) -> String {
        let ans = answer.map{ $0 }
        let matches: (Int, Int) = input
            .map{ $0 }
            .reduce((0, 0), { tupple, c in
                if ans.contains(c) {
                    return (tupple.0 + 1, tupple.1)
                }else{
                    return (tupple.0, tupple.1 + 1)
                }
            })
        if matches.0 == 4 {
            showEndGame()
            return "4b"
        }
        
        return "\(matches.0)b \(matches.1)c"
    }
    
    private func showEndGame() {
        
        DispatchQueue.main.async {
            let alert = NSAlert()
            alert.messageText = "You win"
            alert.informativeText = "Click to Ok to play again"
            
            alert.runModal()
            
            self.startANewGame()
        }
    }
}


// MARK: NSTableView Datasource & Delegate

extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.guesses.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        switch tableColumn?.title {
        case "Guess":
            cell.textField?.stringValue = guesses[row]
            
        case "Result":
            cell.textField?.stringValue = result(for: guesses[row])
            
        default: break
        }
        
        return cell
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return false
    }
}
