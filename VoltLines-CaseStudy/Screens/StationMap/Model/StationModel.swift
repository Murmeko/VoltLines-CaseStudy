//
//  StationModel.swift
//  VoltLines-CaseStudy
//
//  Created by Yiğit Erdinç on 18.06.2023.
//

import Foundation

typealias StationModelList = [StationModel]

struct StationModel: Codable {
  let centerCoordinates: String
  let id: Int
  let name: String
  let trips: [TripModel]
  let tripsCount: Int
  var isBooked: Bool = false
  
  enum CodingKeys: String, CodingKey {
    case centerCoordinates = "center_coordinates"
    case id, name, trips
    case tripsCount = "trips_count"
  }
}
