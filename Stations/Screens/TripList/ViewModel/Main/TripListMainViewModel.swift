//
//  TripListMainViewModel.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListMainViewModelProtocol {
  var updateUI: VoidHandler? { get set }
  var showAlertView: ((_ alertItem: AlertItem) -> Void)? { get set }
  
  var station: Station { get set }
  var parser: TripListParserProtocol { get }
  var cellViewModels: [TripListBaseCellViewModelProtocol] { get set }
}

class TripListMainViewModel: TripListMainViewModelProtocol {
  var updateUI: VoidHandler?
  var showAlertView: ((_ alertItem: AlertItem) -> Void)?
  
  var station: Station
  let parser: TripListParserProtocol
  var cellViewModels: [TripListBaseCellViewModelProtocol] = []
  
  init(station: Station, parser: TripListParserProtocol) {
    self.station = station
    self.parser = parser
    self.parseDataSource()
  }
  
  private func parseDataSource() {
    do {
      self.cellViewModels = try parser.parseDataSource(from: station)
      self.updateUI?()
    } catch {
      print("Error while parsing trips")
    }
  }
}
