//
//  MapsRouter.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//
import Foundation

protocol MapRouterProtocol: BaseRouterProtocol {
  func showTrips(for station: Station)
}

class MapRouter: BaseRouter, MapRouterProtocol {
  func showTrips(for station: Station) {
    let tripListVC = ViewControllerMaker.tripListViewController(for: station)
    tripListVC.modalPresentationStyle = .fullScreen
    presentViewController?(tripListVC)
  }
}
