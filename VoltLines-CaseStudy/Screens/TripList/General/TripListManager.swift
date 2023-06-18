//
//  TripListManager.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListManagerProtocol {
  var viewModel: TripListMainViewModelProtocol { get set }
  var router: TripListRouterProtocol { get set }
  var parser: TripListParserProtocol { get set }
  var networkManager: TripListNetworkManagerProtocol { get set }
  var dataSource: TripListDataSource { get set }
  var station: StationModel { get set }
}

class TripListManager: TripListManagerProtocol {
  var station: StationModel
  
  init(station: StationModel) {
    self.station = station
  }
  
  lazy var viewModel: TripListMainViewModelProtocol = {
    return TripListMainViewModel(station: station, parser: parser)
  }()
  
  lazy var parser: TripListParserProtocol = {
    return TripListParser()
  }()
  
  lazy var router: TripListRouterProtocol = {
    return TripListRouter()
  }()
  
  lazy var networkManager: TripListNetworkManagerProtocol = {
    return TripListNetworkManager(viewModel: viewModel, router: router)
  }()
  
  lazy var dataSource: TripListDataSource = {
    return TripListDataSource(viewModel: viewModel, router: router, networkManager: networkManager)
  }()
}
