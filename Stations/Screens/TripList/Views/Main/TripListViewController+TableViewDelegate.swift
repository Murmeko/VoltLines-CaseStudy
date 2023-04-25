//
//  TripListViewController+TableViewDelegate.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import UIKit

extension TripListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}
