//
//  MapViewController+LocationHelpers.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import CoreLocation

extension MapViewController: CLLocationManagerDelegate {
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    switch manager.authorizationStatus {
    case .authorizedAlways, .authorizedWhenInUse:
      manager.startUpdatingLocation()
      mapView.isMyLocationEnabled = true
      navigateToCurrentLocation()
    default:
      manager.stopUpdatingLocation()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {}
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {}
}

extension MapViewController {
  func checkLocationUpdates() {
    switch locationManager.authorizationStatus {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .authorizedWhenInUse, .authorizedAlways:
      locationManager.startUpdatingLocation()
    default:
      print("could show an error view here")
    }
  }
}
