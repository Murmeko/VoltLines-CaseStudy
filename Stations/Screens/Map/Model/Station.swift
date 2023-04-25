//
//  Station.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

typealias Stations = [Station]

struct Station: Codable {
  let centerCoordinates: String
  let id: Int
  let name: String
  let trips: [Trip]
  let tripsCount: Int
  var isBooked: Bool = false
  
  enum CodingKeys: String, CodingKey {
    case centerCoordinates = "center_coordinates"
    case id, name, trips
    case tripsCount = "trips_count"
  }
}
