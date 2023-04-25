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
  
  init(viewModel: TripListMainViewModelProtocol, router: TripListRouterProtocol) {
    self.viewModel = viewModel
    self.router = router
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TripListTripCell", for: indexPath) as? TripListTripCell else { fatalError() }
    guard let headerCell = tableView.dequeueReusableCell(withIdentifier: "TripListHeaderCell", for: indexPath) as? TripListHeaderCell else { fatalError() }
    if indexPath.row == 0 {
      headerCell.router = router
      return headerCell
    } else {
      return cell
    }
  }
}
