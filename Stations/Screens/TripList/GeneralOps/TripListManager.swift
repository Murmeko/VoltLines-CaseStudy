//
//  TripListManager.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListManagerProtocol {
  var viewModel: TripListMainViewModelProtocol { get set }
  var router: TripListRouterProtocol { get set }
  var networkManager: TripListNetworkManagerProtocol { get set }
  var dataSource: TripListDataSource { get set }
}

class TripListManager: TripListManagerProtocol {
  var trips: [Trip]
  
  init(trips: [Trip]) {
    self.trips = trips
  }
  
  lazy var viewModel: TripListMainViewModelProtocol = {
    return TripListMainViewModel()
  }()
  
  lazy var router: TripListRouterProtocol = {
    return TripListRouter()
  }()
  
  lazy var networkManager: TripListNetworkManagerProtocol = {
    return TripListNetworkManager()
  }()
  
  lazy var dataSource: TripListDataSource = {
    return TripListDataSource(viewModel: viewModel)
  }()
}
