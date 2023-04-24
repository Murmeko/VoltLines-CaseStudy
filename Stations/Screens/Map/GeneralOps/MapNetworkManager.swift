//
//  StationsNetworkManager.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

protocol MapNetworkManagerProtocol: BaseNetworkManagerProtocol {}

class MapNetworkManager: MapNetworkManagerProtocol {
  let viewModel: MapMainViewModeProtocol
  
  init(viewModel: MapMainViewModeProtocol) {
    self.viewModel = viewModel
  }
  
  func requestPage() {
    guard let apiMethod = getAPIMethod() else { return }
    let target = StationsAPI(apiMethod: apiMethod)
    
    StationsAPIProvider.apiProvider.request(target) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.global(qos: .userInitiated).async {
        switch result {
        case .success(let response):
          do {
            let mappedData = try JSONDecoder().decode(Stations.self, from: response.data)
            print(mappedData)
          } catch let error {
            print(error)
          }
        case .failure(let error):
          print(error)
        }
      }
    }
    
  }
  
  private func handleResponse(_ responseModel: Stations) {
    do {
      
    } catch let error {
      print(error)
    }
  }
  
  private func getAPIMethod() -> StationsAPIMethod? {
    return StationsAPIMethod.getStations
  }
}
