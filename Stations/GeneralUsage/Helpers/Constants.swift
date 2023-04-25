//
//  Constants.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

struct Constants {
  static let baseURL = "https://demo.voltlines.com/"
  static let gmAPIKey = "AIzaSyCkAxCC3gasmwpNwOejbGRZcDPB67ONVr4"
  
  static let tripCellIdentifier = "TripListTripCell"
  static let tripListHeaderCellIdentifier = "TripListHeaderCell"
  
  static let bookedMarkerIconName = "completed"
  static let selectedMarkerIconName = "selected_point"
  static let regularMarkerIconName = "point"
  
  static let bookedTripNotificationName = Notification.Name("TripBooked")
}
