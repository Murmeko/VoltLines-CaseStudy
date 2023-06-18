//
//  TripListBaseCellViewModel.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

protocol TripListBaseCellViewModelProtocol {
  var cellType: TripListCellType { get }
}

class TripListBaseCellViewModel: TripListBaseCellViewModelProtocol {
  var cellType: TripListCellType = .tripCell
}
