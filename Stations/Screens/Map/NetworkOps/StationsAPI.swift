//
//  StationsAPI.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Moya

enum StationsAPIMethod {
  case getStations
  case bookingRequest(stationID: Int, tripID: Int)
}

struct StationsAPI {
  var id = UUID()
  let apiMethod: StationsAPIMethod
}

extension StationsAPI: TargetType {
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
    var params: [String: Any] = [:]
    
    switch apiMethod {
    case .getStations:
      return .requestPlain
    case .bookingRequest(let stationID, let tripID):
      return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type" : "application/json"]
  }
}
