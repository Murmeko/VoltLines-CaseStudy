//
//  ViewControllerMaker.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

class ViewControllerMaker {}

extension ViewControllerMaker {
  static func mapViewController() -> MapViewController {
    let manager = MapManager()
    return MapViewController(manager: manager)
  }
  
  static func tripListViewController(for station: Station) -> TripListViewController {
    let manager = TripListManager(station: station)
    return TripListViewController(manager: manager)
  }
}
