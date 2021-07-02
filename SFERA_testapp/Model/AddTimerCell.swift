//
//  AddTimerCell.swift
//  SFERA_testapp
//
//  Created by Vladimir Gorbunov on 01.07.2021.
//

import UIKit

class AddTimerCell: UITableViewCell, UITextFieldDelegate {
    
    let titleInput : UITextField = {
        let title = UITextField()
        title.placeholder = " Название таймера"
        title.layer.borderWidth = 1
        title.layer.borderColor = UIColor.systemGray4.cgColor
        title.layer.cornerRadius = 5
        return title
    }()
    
    let timeInput : UITextField = {
        let time = UITextField()
        time.keyboardType = UIKeyboardType.numberPad
        time.placeholder = " Время в секундах"
        time.layer.borderWidth = 1
        time.layer.borderColor = UIColor.systemGray4.cgColor
        time.layer.cornerRadius = 5
        time.addTarget(self, action: #selector(textField(_:shouldChangeCharactersIn:replacementString:)), for: .editingChanged)
        return time
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == timeInput {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    var button: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Добавить", for: .normal)
        button.tintColor = .systemBlue
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        timeInput.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConstraints()
    }
    
    func getTitle() -> String {
        if titleInput.text?.count == 0 {
            return "Default timer 60sec"
        }
        return (titleInput.text!)
    }
    
    func getTime() -> Int {
        if timeInput.text?.count == 0 {
            return 60
        }
        let time = timeInput.text
        return Int(time!)!
    }
    
    func setConstraints(){
        contentView.addSubview(titleInput)
        contentView.addSubview(timeInput)
        contentView.addSubview(button)
        
        titleInput.translatesAutoresizingMaskIntoConstraints = false
        timeInput.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        titleInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleInput.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleInput.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6).isActive = true
        titleInput.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        timeInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        timeInput.topAnchor.constraint(equalTo: titleInput.bottomAnchor, constant: 20).isActive = true
        timeInput.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6).isActive = true
        timeInput.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: 30).isActive = true
        button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
    }
}
