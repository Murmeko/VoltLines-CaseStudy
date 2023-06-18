//
//  TripListNetworkManager.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Moya

protocol TripListNetworkManagerProtocol {
  func requestBooking(for tripID: Int)
}

class TripListNetworkManager: TripListNetworkManagerProtocol {
  var viewModel: TripListMainViewModelProtocol
  let router: TripListRouterProtocol

  private let provider = MoyaProvider<StationMapAPI>()
  
  init(viewModel: TripListMainViewModelProtocol, router: TripListRouterProtocol) {
    self.viewModel = viewModel
    self.router = router
  }
  
  func requestBooking(for tripID: Int) {
    let target = StationMapAPI(apiMethod: .bookingRequest(stationID: viewModel.station.id, tripID: tripID))
    
    provider.request(target) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.global(qos: .background).async {
        switch result {
        case .success(let response):
          self.handleResponse(response.data)
        case .failure:
          let alertItem = AlertItem(title: "Network error",
                            message: "Please try again.",
                            buttonTitle: "Go Back")
          self.viewModel.showAlertView?(alertItem)
        }
      }
    }
  }
  
  private func handleResponse(_ data: Data) {
    if let _ = try? JSONDecoder().decode(TripModel.self, from: data) {
      // self.router.dismiss?()
      NotificationCenter.default.post(name: Constants.bookedTripNotificationName, object: nil)
    } else {
      let alertItem = AlertItem(title: "The trip you selected is full.",
                        message: "Please select another trip.",
                        buttonTitle: "Select a Trip")
      self.viewModel.showAlertView?(alertItem)
    }
  }
}
