//
//  TripListParser.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListParserProtocol {
  func parseDataSource(from station: StationModel) throws -> [TripListBaseCellViewModelProtocol]
}

class TripListParser: TripListParserProtocol {
  func parseDataSource(from station: StationModel) throws -> [TripListBaseCellViewModelProtocol] {
    var parsedViewModels: [TripListBaseCellViewModelProtocol] = []
    parsedViewModels.append(try createHeaderCellViewModel(from: station))
    try station.trips.forEach({
      let tripCell = try createTripCell(from: $0)
      parsedViewModels.append(tripCell)
    })
    return parsedViewModels
  }
  
  private func createHeaderCellViewModel(from station: StationModel) throws -> TripListHeaderCellViewModelProtocol {
    return TripListHeaderCellViewModel()
  }
  
  private func createTripCell(from trip: TripModel) throws -> TripListTripCellViewModelProtocol {
    let busName = trip.busName
    let busArrival = trip.time
    let tripID = trip.id
    return TripListTripCellViewModel(busName: busName, busArrival: busArrival, tripID: tripID)
  }
}
