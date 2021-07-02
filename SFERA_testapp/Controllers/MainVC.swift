//
//  MainVC.swift
//  SFERA_testapp
//
//  Created by Vladimir Gorbunov on 01.07.2021.
//

import UIKit

class MainVC: UIViewController {
    
    let tableView = UITableView()
    let dataSource = CustomDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мульти таймер"
        
        dataSource.tableView = tableView
        configureTableView()
        dataSource.updateAndRemoveTimers(table: tableView)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView(frame: .zero)
    }
}
