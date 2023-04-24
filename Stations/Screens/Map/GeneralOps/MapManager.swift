//
//  MapManager.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

protocol MapManagerProtocol {
  var viewModel: MapMainViewModeProtocol { get set }
  var networkManager: MapNetworkManagerProtocol { get set }
}

class MapManager: MapManagerProtocol {
  lazy var viewModel: MapMainViewModeProtocol = {
    return MapMainViewModel()
  }()
  
  lazy var networkManager: MapNetworkManagerProtocol = {
    return MapNetworkManager()
  }()
}
