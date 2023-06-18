//
//  TripModel.swift
//  VoltLines-CaseStudy
//
//  Created by Yiğit Erdinç on 18.06.2023.
//

import Foundation

struct TripModel: Codable {
  let busName: String
  let id: Int
  let time: String
  
  enum CodingKeys: String, CodingKey {
    case busName = "bus_name"
    case id, time
  }
}
