//
//  TripListViewController+Bindings.swift
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
  
  final func showAlertView() -> (_ alertItem: AlertItem) -> Void {
    return { [weak self] alertItem in
      guard let self = self else { return }
      DispatchQueue.main.async {
        CustomAlertView.showAlert(on: self.view, alert: alertItem)
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
