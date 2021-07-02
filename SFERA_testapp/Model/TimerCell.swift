//
//  TimerCell.swift
//  SFERA_testapp
//
//  Created by Vladimir Gorbunov on 01.07.2021.
//

import UIKit

class TimerCell: UITableViewCell {
    
    let cellID = "timerCell"
    
    let button = UIButton(type: .roundedRect)
    
    init(style: UITableViewCell.CellStyle, timerModel: TimerModel) {
        super.init(style: style, reuseIdentifier: cellID)
        settings(timer: timerModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func settings(timer: TimerModel) {
        textLabel?.text = timer.title
        let secondsLikeTime = secondsLikeTime(seconds: timer.seconds)
        detailTextLabel?.text = secondsLikeTime
        
        button.setTitle(timer.isActive ? " Stop " : " Continue ", for: .normal)
        button.sizeToFit()
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        accessoryView = button
    }
    
    func secondsLikeTime(seconds: Int) -> String {
        let minutes = (seconds / 60)
        let seconds = (seconds % 60)
        let clock = String(format: "%d:%02d", minutes, seconds)
        return clock
    }
}
