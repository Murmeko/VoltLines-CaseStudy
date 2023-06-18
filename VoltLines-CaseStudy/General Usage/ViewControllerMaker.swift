//
//  ViewControllerMaker.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

class ViewControllerMaker {}

extension ViewControllerMaker {
  static func mapViewController() -> StationMapViewController {
    return StationMapViewController()
  }
  
  static func tripListViewController(for station: StationModel) -> TripListViewController {
    let manager = TripListManager(station: station)
    return TripListViewController(manager: manager)
  }
}
