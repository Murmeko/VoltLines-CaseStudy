//
//  TripListHeaderCellViewModel.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListHeaderCellViewModelProtocol: TripListBaseCellViewModelProtocol {
  
}

class TripListHeaderCellViewModel: TripListBaseCellViewModel, TripListHeaderCellViewModelProtocol {
  override init() {
    super.init()
    cellType = .headerCell
  }
}
