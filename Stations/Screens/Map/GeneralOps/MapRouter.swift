//
//  MapsRouter.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//
import Foundation

protocol MapRouterProtocol: BaseRouterProtocol {
  func showTrips(with tripList: [Trip])
}

class MapRouter: BaseRouter, MapRouterProtocol {
  func showTrips(with tripList: [Trip]) {
    let movieDetailVC = ViewControllerMaker.tripListViewController(trips: tripList)
    movieDetailVC.modalPresentationStyle = .fullScreen
    presentViewController?(movieDetailVC)
  }
}
