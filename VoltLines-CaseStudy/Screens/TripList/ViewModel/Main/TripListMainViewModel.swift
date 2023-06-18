//
//  TripListMainViewModel.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListMainViewModelProtocol {
  var updateUI: (() -> Void)? { get set }
  var showAlertView: ((_ alertItem: AlertItem) -> Void)? { get set }
  
  var station: StationModel { get set }
  var parser: TripListParserProtocol { get }
  var cellViewModels: [TripListBaseCellViewModelProtocol] { get set }
}

class TripListMainViewModel: TripListMainViewModelProtocol {
  var updateUI: (() -> Void)?
  var showAlertView: ((_ alertItem: AlertItem) -> Void)?
  
  var station: StationModel
  let parser: TripListParserProtocol
  var cellViewModels: [TripListBaseCellViewModelProtocol] = []
  
  init(station: StationModel, parser: TripListParserProtocol) {
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
