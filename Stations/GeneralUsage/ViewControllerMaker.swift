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
  
  static func tripListViewController(trips: [Trip]) -> TripListViewController {
    let manager = TripListManager(trips: trips)
    return TripListViewController(manager: manager)
  }
}
