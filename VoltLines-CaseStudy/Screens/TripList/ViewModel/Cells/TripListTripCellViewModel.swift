//
//  TripListTripCellViewModel.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListTripCellViewModelProtocol: TripListBaseCellViewModelProtocol {
  var busName: String { get }
  var busArrival: String { get }
  var tripID: Int { get }
}

class TripListTripCellViewModel: TripListBaseCellViewModel, TripListTripCellViewModelProtocol {
  var busName: String
  var busArrival: String
  var tripID: Int
  
  init(busName: String, busArrival: String, tripID: Int) {
    self.busName = busName
    self.busArrival = busArrival
    self.tripID = tripID
    super.init()
    self.cellType = .tripCell
  }
}
