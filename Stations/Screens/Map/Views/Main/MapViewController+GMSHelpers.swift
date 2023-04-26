//
//  MapViewController+GMSHelpers.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 25.04.2023.
//

import GoogleMaps

extension MapViewController: GMSMapViewDelegate {
  func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
    guard let selectedStation = marker.userData as? Station else { return true }
    
    manager.viewModel.selectedStation = selectedStation
    listTripsButton.isHidden = false
    
    if marker.icon != UIImage(named: Constants.bookedMarkerIconName) {
      marker.icon = UIImage(named: Constants.selectedMarkerIconName)
    }
    
    return false
  }
  
  func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
    guard marker.icon != UIImage(named: Constants.bookedMarkerIconName) else { return }
    marker.icon = UIImage(named: Constants.regularMarkerIconName)
  }
  
  
  func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
    mapView.selectedMarker = nil
    manager.viewModel.selectedStation = nil
    listTripsButton.isHidden = true
  }
}

extension MapViewController {
  func createMarkers(from stations: Stations){
    stations.forEach { station in
      let coordinatesArray = station.centerCoordinates.components(separatedBy: ",")
      
      guard
        let latitude = Double(coordinatesArray[0]),
        let longtitude = Double(coordinatesArray[1])
      else { return }
      
      let marker = GMSMarker()
      marker.tracksViewChanges = false
      marker.icon = UIImage(named: Constants.regularMarkerIconName)
      marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
      marker.userData = station
      marker.title = String(station.tripsCount) + " Trips"
      
      marker.map = mapView
    }
  }
  
  func navigateToCurrentLocation() {
    guard let currentLocation = locationManager.location else { return }
    let camera = GMSCameraPosition.camera(withTarget: currentLocation.coordinate, zoom: 12)
    mapView.animate(to: camera)
  }
  
  @objc func handleTripBooked() {
    if let selectedMarker = mapView.selectedMarker {
      DispatchQueue.main.async {
        selectedMarker.icon = UIImage(named: Constants.bookedMarkerIconName)
        self.listTripsButton.isHidden = true
        self.manager.viewModel.selectedStation = nil
        self.mapView.selectedMarker = nil
      }
    }
  }
}
