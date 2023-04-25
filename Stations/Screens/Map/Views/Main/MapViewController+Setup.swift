//
//  MapViewController+Setup.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import UIKit

extension MapViewController {
  final func setupMapView() {
    view.addSubview(mapView)
    
    mapView.delegate = self
    
    mapView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([mapView.topAnchor.constraint(equalTo: view.topAnchor),
                                 mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 mapView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                                 mapView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)])
  }
  
  final func setupBindings() {
    manager.router.presentViewController = presentViewController()
    
    manager.viewModel.showAlertView = showAlertView()
  }
}
