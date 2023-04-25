//
//  MapMainViewModel.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

protocol MapMainViewModeProtocol {
  var showAlertView: VoidHandler? { get set }
}

class MapMainViewModel: MapMainViewModeProtocol {
  var showAlertView: VoidHandler?
}
