//
//  TripListViewController+Methods.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import Foundation

extension TripListViewController {
  final func updateUI() -> VoidHandler? {
    return { [weak self] in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  final func showAlertView() -> (_ alert: Alert) -> Void {
    return { [weak self] alert in
      guard let self = self else { return }
      DispatchQueue.main.async {
        CustomAlertView.showAlert(on: self.view, alert: alert)
      }
    }
  }
  
  final func dismiss() -> VoidHandler? {
    return { [weak self] in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.dismiss(animated: true, completion: nil)
      }
    }
  }
}
