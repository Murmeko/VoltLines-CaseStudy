//
//  TripListNetworkManager.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListNetworkManagerProtocol: BaseNetworkManagerProtocol {
  func requestBooking()
}

class TripListNetworkManager: TripListNetworkManagerProtocol {
  func requestPage() {}
  
  func requestBooking() {
    print("booking operation")
  }
}
