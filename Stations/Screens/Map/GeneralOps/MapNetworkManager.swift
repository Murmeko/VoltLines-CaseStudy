//
//  StationsNetworkManager.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

protocol MapNetworkManagerProtocol: BaseNetworkManagerProtocol {
  func requestStations()
}

class MapNetworkManager: MapNetworkManagerProtocol {
  var viewModel: MapMainViewModeProtocol
  
  init(viewModel: MapMainViewModeProtocol) {
    self.viewModel = viewModel
  }
  
  func requestStations() {
    guard let apiMethod = getAPIMethod() else { return }
    let target = StationsAPI(apiMethod: apiMethod)
    
    StationsAPIProvider.apiProvider.request(target) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.global(qos: .background).async {
        switch result {
        case .success(let response):
          do {
            let mappedData = try JSONDecoder().decode(Stations.self, from: response.data)
            self.viewModel.stations = mappedData
            self.viewModel.updateMarkers?()
          } catch let error {
            print(error)
          }
        case .failure(let error):
          print(error)
        }
      }
    }
    
  }
  
  private func getAPIMethod() -> StationsAPIMethod? {
    return StationsAPIMethod.getStations
  }
}
