//
//  MapViewController+Methods.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import Foundation

extension MapViewController {
  final func showAlertView() -> VoidHandler? {
    return { [weak self] in
      guard let self = self else { return }
      CustomAlertView.showAlert(on: view, message: "", type: .failure)
    }
  }
}
