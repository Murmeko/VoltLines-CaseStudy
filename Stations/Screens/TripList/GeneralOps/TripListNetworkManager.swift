//
//  TripListNetworkManager.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListNetworkManagerProtocol: BaseNetworkManagerProtocol {
  func requestBooking(for tripID: Int)
}

class TripListNetworkManager: TripListNetworkManagerProtocol {
  var viewModel: TripListMainViewModelProtocol
  let router: TripListRouterProtocol
  
  init(viewModel: TripListMainViewModelProtocol, router: TripListRouterProtocol) {
    self.viewModel = viewModel
    self.router = router
  }
  
  func requestBooking(for tripID: Int) {
    guard let apiMethod = getAPIMethod(for: tripID) else { return }
    let target = StationsAPI(apiMethod: apiMethod)
    
    StationsAPIProvider.apiProvider.request(target) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.global(qos: .background).async {
        switch result {
        case .success(let response):
          self.handleResponse(response.data)
        case .failure:
          let alert = AlertItem(title: "Network error",
                            message: "Please try again.",
                            buttonTitle: "Go Back")
          self.viewModel.showAlertView?(alert)
        }
      }
    }
  }
  
  private func handleResponse(_ data: Data) {
    if let _ = try? JSONDecoder().decode(Trip.self, from: data) {
      self.router.dismiss?()
      NotificationCenter.default.post(name: Constants.bookedTripNotificationName, object: nil)
    } else {
      let alert = AlertItem(title: "The trip you selected is full.",
                        message: "Please select another trip.",
                        buttonTitle: "Select a Trip")
      self.viewModel.showAlertView?(alert)
    }
  }
  
  private func getAPIMethod(for tripID: Int) -> StationsAPIMethod? {
    return StationsAPIMethod.bookingRequest(stationID: viewModel.station.id, tripID: tripID)
  }
}
