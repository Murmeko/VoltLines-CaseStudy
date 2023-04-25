//
//  Trip.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

struct Trip: Codable {
  let busName: String
  let id: Int
  let time: String
  
  enum CodingKeys: String, CodingKey {
    case busName = "bus_name"
    case id, time
  }
}
