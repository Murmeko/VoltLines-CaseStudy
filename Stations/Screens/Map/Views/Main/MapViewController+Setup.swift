//
//  MapViewController+Setup.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import UIKit
import GoogleMaps

extension MapViewController {
  final func setupMapView() {
    view.addSubview(mapView)
    view.addSubview(listTripsButton)
    
    mapView.delegate = self
    mapView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([listTripsButton.heightAnchor.constraint(equalToConstant: 48),
                                 listTripsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                                 listTripsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                                 listTripsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)])
    
    NSLayoutConstraint.activate([mapView.topAnchor.constraint(equalTo: view.topAnchor),
                                 mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 mapView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                                 mapView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)])
    
    NotificationCenter.default.addObserver(self, selector: #selector(handleTripBooked), name: Constants.bookedTripNotificationName, object: nil)
  }
  
  final func styleMap() {
    do {
      if let jsonURL = Bundle.main.url(forResource: "MapStyle", withExtension: "json") {
        mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: jsonURL)
      }
    } catch let error {
      print(error)
    }
  }
  
  final func setupBindings() {
    manager.router.presentViewController = presentViewController()
    manager.viewModel.updateMarkers = updateMarkers()
  }
  
  @objc func listTripsTapped() {
    if let station = manager.viewModel.selectedStation {
      manager.router.showTrips(for: station)
    }
  }
}
