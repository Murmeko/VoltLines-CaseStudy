//
//  TripListDataSource.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import UIKit

class TripListDataSource: NSObject, UITableViewDataSource {
  let viewModel: TripListMainViewModelProtocol
  let router: TripListRouterProtocol
  let networkManager: TripListNetworkManagerProtocol
  
  init(viewModel: TripListMainViewModelProtocol, router: TripListRouterProtocol, networkManager: TripListNetworkManagerProtocol) {
    self.viewModel = viewModel
    self.router = router
    self.networkManager = networkManager
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.cellViewModels.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellViewModel = viewModel.cellViewModels[indexPath.row]
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellType.identifier, for: indexPath) as? TripListBaseTableViewCell else { fatalError("Error while dequeing detail cell") }
    cell.viewModel = cellViewModel
    cell.router = router
    cell.networkManager = networkManager
    cell.configureCell()
    return cell
  }
}
