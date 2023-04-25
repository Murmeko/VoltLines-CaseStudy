//
//  ViewController.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import UIKit
import CoreLocation
import GoogleMaps

class MapViewController: UIViewController {
  var manager: MapManagerProtocol
  
  private lazy var locationManager: CLLocationManager = {
    let manager = CLLocationManager()
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.delegate = self
    return manager
  }()
  
  lazy var listTripsButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 22/255, green: 36/255, blue: 171/255, alpha: 1)
    button.setTitle("List Trips", for: .normal)
    button.titleLabel?.textAlignment = .center
    button.titleLabel?.textColor = .white
    button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    button.layer.cornerRadius = 24
    button.addTarget(self, action: #selector(listTripsTapped), for: .touchUpInside)
    button.isHidden = true
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let mapView: GMSMapView = {
    let map = GMSMapView(frame: .zero)
    map.mapType = .normal
    return map
  }()
  
  init(manager: MapManagerProtocol) {
    self.manager = manager
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    checkLocationUpdates()
    styleMap()
    setupMapView()
    setupBindings()
    manager.networkManager.requestPage()
  }
  
  func createMarkers(from stations: Stations){
    stations.forEach { station in
      guard
        let latitude = Double(station.centerCoordinates.components(separatedBy: ",")[0]),
        let longtitude = Double(station.centerCoordinates.components(separatedBy: ",")[1])
      else { return }
      
      let marker = GMSMarker()
      marker.icon = UIImage(named: "point")
      marker.position = CLLocationCoordinate2D(latitude: latitude,
                                               longitude: longtitude)
      marker.title = "\(station.tripsCount) Trips"
      marker.userData = station
      marker.tracksViewChanges = false
      marker.map = mapView
    }
  }
  
  func checkLocationUpdates() {
    switch locationManager.authorizationStatus {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .authorizedWhenInUse, .authorizedAlways:
      locationManager.startUpdatingLocation()
    default:
      print("show an error view here")
    }
  }
  
  func navigateToCurrentLocation() {
    guard let currentLocation = locationManager.location else { return }
    let camera = GMSCameraPosition.camera(withTarget: currentLocation.coordinate,
                                          zoom: 12)
    mapView.animate(to: camera)
  }
}

extension MapViewController: GMSMapViewDelegate {
  func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
    print("info tapped")
  }
  
  func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
    if let selectedStation = marker.userData as? Station {
      manager.viewModel.selectedStation = selectedStation
      listTripsButton.isHidden = false
    }
    return false
  }
  
  func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
    manager.viewModel.selectedStation = nil
    listTripsButton.isHidden = true
  }
}

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
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
  }
}

