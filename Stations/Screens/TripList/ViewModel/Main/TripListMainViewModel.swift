//
//  TripListMainViewModel.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListMainViewModelProtocol {
  var updateUI: VoidHandler? { get set }
  var showAlertView: VoidHandler? { get set }
}

class TripListMainViewModel: TripListMainViewModelProtocol {
  var updateUI: VoidHandler?
  var showAlertView: VoidHandler?
}
