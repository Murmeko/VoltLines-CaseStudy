//
//  StationMapPresenter.swift
//  VoltLines-CaseStudy
//
//  Created by Yiğit Erdinç on 18.06.2023.
//

import Foundation
import GoogleMaps

class StationMapPresenter {
  weak var presenterView: StationMapViewController?

  private var networkManager = StationMapNetworkManager()
  
  private var stationModelList: StationModelList = []
  private var selectedStationModel: StationModel?

  init(view: StationMapViewController) {
    presenterView = view
  }
}

extension StationMapPresenter {
  func getStationList() {
    networkManager.getStationList { [weak self] stationModelList in
      guard let self else { return }
      if let stationModelList { self.stationModelList = stationModelList; self.updateLocationMarkers() }
    }
  }

  private func updateLocationMarkers() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }

      self.stationModelList.forEach { stationModel in
        let coordinatesList = stationModel.centerCoordinates.components(separatedBy: ",")

        guard let latitude = Double(coordinatesList[0]), let longtitude = Double(coordinatesList[1]) else { return }
        let marker = GMSMarker()
        marker.tracksViewChanges = false
        marker.icon = UIImage(named: Constants.regularMarkerIconName)
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        marker.userData = stationModel
        marker.title = String(stationModel.tripsCount) + " Trips"
        marker.map = self.presenterView?.mapView
      }
    }
  }
}

extension StationMapPresenter {
  func showTrips(for station: StationModel) {
    let tripListVC = ViewControllerMaker.tripListViewController(for: station)
    tripListVC.modalPresentationStyle = .fullScreen
    presenterView?.present(tripListVC, animated: true)
  }

  func navigateToCurrentLocation() {
    guard let currentLocation = presenterView?.locationManager.location else { return }
    let camera = GMSCameraPosition.camera(withTarget: currentLocation.coordinate, zoom: 12)
    presenterView?.mapView.animate(to: camera)
  }
}

extension StationMapPresenter {
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    switch manager.authorizationStatus {
    case .authorizedAlways, .authorizedWhenInUse:
      manager.startUpdatingLocation()
      presenterView?.mapView.isMyLocationEnabled = true
      navigateToCurrentLocation()
    default:
      manager.stopUpdatingLocation()
    }
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    return
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    return
  }
}

extension StationMapPresenter {
  func checkLocationUpdates() {
    switch presenterView?.locationManager.authorizationStatus {
    case .notDetermined:
      presenterView?.locationManager.requestWhenInUseAuthorization()
    case .authorizedWhenInUse, .authorizedAlways:
      presenterView?.locationManager.startUpdatingLocation()
    default:
      print("could show an error view here")
    }
  }
}

extension StationMapPresenter {
  func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
    guard let selectedStation = marker.userData as? StationModel else { return true }
    selectedStationModel = selectedStation
    presenterView?.listTripsButton.isHidden = false
    if marker.icon != UIImage(named: Constants.bookedMarkerIconName) { marker.icon = UIImage(named: Constants.selectedMarkerIconName) }
    return false
  }

  func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
    guard marker.icon != UIImage(named: Constants.bookedMarkerIconName) else { return }
    marker.icon = UIImage(named: Constants.regularMarkerIconName)
  }


  func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
    mapView.selectedMarker = nil
    selectedStationModel = nil
    presenterView?.listTripsButton.isHidden = true
  }
}

extension StationMapPresenter {
  final func styleMap() {
    do {
      if let jsonURL = Bundle.main.url(forResource: "MapStyle", withExtension: "json") {
        presenterView?.mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: jsonURL)
      }
    } catch let error {
      print(error)
    }
  }
}

extension StationMapPresenter {
  func handleListTripsTapped() {
    if let station = selectedStationModel {
      showTrips(for: station)
    }
  }

  func handleTripBooked() {
    if let selectedMarker = presenterView?.mapView.selectedMarker {
      DispatchQueue.main.async { [weak self] in
        guard let self = self else { return }
        selectedMarker.icon = UIImage(named: Constants.bookedMarkerIconName)
        self.selectedStationModel = nil
        self.presenterView?.listTripsButton.isHidden = true
        self.presenterView?.mapView.selectedMarker = nil
      }
    }
  }
}
