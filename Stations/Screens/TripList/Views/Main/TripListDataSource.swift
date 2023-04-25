//
//  TripListDataSource.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import UIKit

class TripListDataSource: NSObject, UITableViewDataSource {
  let viewModel: TripListMainViewModelProtocol
  
  init(viewModel: TripListMainViewModelProtocol) {
    self.viewModel = viewModel
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TripListTripCell", for: indexPath) as? TripListTripCell else { fatalError() }
    return cell
  }
}
