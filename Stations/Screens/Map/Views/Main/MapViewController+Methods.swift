//
//  MapViewController+Methods.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import UIKit

extension MapViewController {
  final func updateMarkers() -> VoidHandler? {
    return { [weak self] in
      guard let self = self else { return }
      createMarkers(from: manager.viewModel.stations)
    }
  }
  
  func presentViewController() -> (_ viewController: UIViewController) -> Void {
    return { [weak self] viewController in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.present(viewController, animated: true, completion: nil)
      }
    }
  }
}
