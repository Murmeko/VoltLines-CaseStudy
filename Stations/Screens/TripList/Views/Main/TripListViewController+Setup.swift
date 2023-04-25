//
//  TripListViewController+Setup.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import UIKit

extension TripListViewController {
  final func setupGeneralView() {
    view.backgroundColor = .white
  }
  
  final func setupTableView() {
    self.tableView = UITableView(frame: .zero, style: .plain)
    self.tableView.delegate = self
    self.tableView.dataSource = manager.dataSource
    self.tableView.separatorStyle = .none
    
    self.tableView.allowsMultipleSelection = false
    self.tableView.backgroundColor = .white
    
    view.addSubview(tableView)
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                 self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 self.tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                                 self.tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)])
    
    TripListCellType.allCases.forEach { cellType in
      self.tableView.register(UINib(nibName: cellType.identifier, bundle: nil), forCellReuseIdentifier: cellType.identifier)
    }
  }
  
  final func setupBindings() {
    manager.router.dismiss = dismiss()
    
    manager.viewModel.updateUI = updateUI()
    manager.viewModel.showAlertView = showAlertView()
  }
}
