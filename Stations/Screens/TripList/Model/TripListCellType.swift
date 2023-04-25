//
//  TripListCellType.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

enum TripListCellType: CaseIterable {
  case tripCell
 // case headerCell

  var identifier: String {
    switch self {
    case .tripCell: return Constants.tripCellIdentifier
   // case .headerCell: return Constants.tripListHeaderCellIdentifier
    }
  }
}
