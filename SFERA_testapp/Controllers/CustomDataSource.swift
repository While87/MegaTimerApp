//
//  CustomDataSource.swift
//  SFERA_testapp
//
//  Created by Vladimir Gorbunov on 01.07.2021.
//

import UIKit

class CustomDataSource: NSObject, UITableViewDataSource {
    
    var tableView = UITableView()
    var timers = [TimerModel]()
    
    func updateAndRemoveTimers(table: UITableView) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            for (index, timer) in self.timers.enumerated() {
                if timer.isActive {
                    if timer.seconds > 0 {
                        self.timers[index].seconds -= 1
                    } else {
                        self.timers.removeAll(where: {$0.seconds == 0})
                    }
                }
            }
            self.timers.sort(by: {$0.seconds > $1.seconds})
            table.reloadSections(IndexSet(arrayLiteral: 1), with: .none)
        }
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case (0): return "Добавление таймеров"
        case (1): return "Таймеры"
        default: break
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case (0): return 1
        case (1): return timers.count
        default: break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        
            ///Top Cell for add timers
    
            let cell = AddTimerCell()
            cell.selectionStyle = .none
            cell.button.addTarget(self, action: #selector(addNewTimer(sender:)), for: .touchUpInside)
            return cell
        } else {
            
            ///Timer cell
            
            let cell = TimerCell(style: .value1, timerModel: timers[indexPath.row])
            cell.selectionStyle = .none
            cell.button.addTarget(self, action: #selector(stopTimer(sender:)), for: .touchUpInside)
            cell.button.tag = indexPath.row
            return cell
        }
    }
    
    @objc func addNewTimer(sender: AnyObject) {
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! AddTimerCell
        timers.append(TimerModel(title: cell.getTitle(), seconds: cell.getTime(), isActive: true))
        cell.titleInput.text = ""
        cell.timeInput.text = ""
    }
    @objc func stopTimer(sender: AnyObject) {
        timers[sender.tag].isActive = !timers[sender.tag].isActive
    }
}
