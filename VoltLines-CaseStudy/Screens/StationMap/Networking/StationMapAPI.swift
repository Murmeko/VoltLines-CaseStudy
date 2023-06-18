//
//  StationMapAPI.swift
//  VoltLines-CaseStudy
//
//  Created by Yiğit Erdinç on 18.06.2023.
//

import Moya

enum StationMapAPIMethod {
  case getStations
  case bookingRequest(stationID: Int, tripID: Int)
}

struct StationMapAPI {
  var id = UUID()
  let apiMethod: StationMapAPIMethod
}

extension StationMapAPI: TargetType {
  var baseURL: URL {
    return URL(string: Constants.baseURL)!
  }
  
  var method: Moya.Method {
    switch apiMethod {
    case .getStations: return .get
    case .bookingRequest: return .post
    }
  }
  
  var path: String {
    switch apiMethod {
    case .getStations:
      return "case-study/6/stations"
    case .bookingRequest(let stationID, let tripID):
      return "case-study/6/stations/\(stationID)/trips/\(tripID)"
    }
  }
  
  var task: Task {
    switch apiMethod {
    case .getStations:
      return .requestPlain
    case .bookingRequest:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type" : "application/json"]
  }
}
