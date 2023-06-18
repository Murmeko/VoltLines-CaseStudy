//
//  Constants.swift
//  VoltLines-CaseStudy
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

struct Constants {
  static let baseURL = "https://demo.voltlines.com/"
  static let gmAPIKey = "AIzaSyBNk_eyxBHDQqAEAVTGXrXGcICqV1-BfeU"
  
  static let tripCellIdentifier = "TripListTripCell"
  static let tripListHeaderCellIdentifier = "TripListHeaderCell"
  
  static let bookedMarkerIconName = "completed"
  static let selectedMarkerIconName = "selected_point"
  static let regularMarkerIconName = "point"
  
  static let bookedTripNotificationName = Notification.Name("TripBooked")
}
