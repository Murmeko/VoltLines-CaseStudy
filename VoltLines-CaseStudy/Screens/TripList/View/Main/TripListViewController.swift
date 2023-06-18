//
//  TripListViewController.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import UIKit

class TripListViewController: UIViewController {
  
  var tableView: UITableView!
  var manager: TripListManagerProtocol
  
  init(manager: TripListManagerProtocol) {
    self.manager = manager
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupGeneralView()
    setupTableView()
    setupBindings()
  }
}
