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
  lazy var locationManager: CLLocationManager = {
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
    button.translatesAutoresizingMaskIntoConstraints = false
    button.isHidden = true
    return button
  }()
  
  lazy var mapView: GMSMapView = {
    let map = GMSMapView(frame: .zero)
    map.mapType = .normal
    return map
  }()
  
  var manager: MapManagerProtocol
  
  init(manager: MapManagerProtocol) {
    self.manager = manager
    super.init(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    checkLocationUpdates()
    styleMap()
    setupMapView()
    setupBindings()
    manager.networkManager.requestStations()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

