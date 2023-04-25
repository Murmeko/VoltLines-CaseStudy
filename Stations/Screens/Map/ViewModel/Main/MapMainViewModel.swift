//
//  MapMainViewModel.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

protocol MapMainViewModeProtocol {
  var updateMarkers: VoidHandler? { get set }
  var showAlertView: VoidHandler? { get set }
  
  var stations: Stations { get set }
  var selectedStation: Station? { get set }
}

class MapMainViewModel: MapMainViewModeProtocol {
  var updateMarkers: VoidHandler?
  var showAlertView: VoidHandler?
  
  var stations: Stations = []
  var selectedStation: Station?
}
