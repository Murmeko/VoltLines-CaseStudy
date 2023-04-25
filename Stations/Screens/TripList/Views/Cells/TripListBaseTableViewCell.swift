//
//  TripListBaseTableViewCell.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import UIKit

class TripListBaseTableViewCell: UITableViewCell {
  var router: TripListRouterProtocol!
  var networkManager: TripListNetworkManagerProtocol!
  var viewModel: TripListBaseCellViewModelProtocol!
  
  override class func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configureCell() {}
}
