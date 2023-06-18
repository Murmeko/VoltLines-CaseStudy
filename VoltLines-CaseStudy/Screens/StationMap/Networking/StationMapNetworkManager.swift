//
//  StationsNetworkManager.swift
//  VoltLines-CaseStudy
//
//  Created by Yiğit Erdinç on 18.06.2023.
//

import Moya

class StationMapNetworkManager {
  private let provider = MoyaProvider<StationMapAPI>()

  func getStationList(completion: @escaping ((StationModelList?) -> Void)) {
    let target = StationMapAPI(apiMethod: .getStations)

    provider.request(target) { [weak self] result in
      guard let self else { return }
      switch result {
      case .success(let response): completion(self.handleStationListResponse(response.data))
      case .failure(let error): print(error); completion(nil)
      }
    }
  }
  
  private func handleStationListResponse(_ responseData: Data) -> StationModelList? {
    do {
      return try JSONDecoder().decode(StationModelList.self, from: responseData)
    } catch let error {
      print(error)
      return nil
    }
  }
}
