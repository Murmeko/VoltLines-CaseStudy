//
//  ViewController.swift
//  Stations
//
//  Created by Hasan Aygünoglu on 24.04.2023.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
  var manager: MapManagerProtocol
  
  let mapView: GMSMapView = {
    let map = GMSMapView(frame: .zero)
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
    setupMapView()
    manager.networkManager.requestPage()
    let camera = GMSCameraPosition.camera(withLatitude: 37.36, longitude: -122.0, zoom: 6.0)
    mapView.camera = camera
    showMarker(position: camera.target)
    view.backgroundColor = .systemRed
  }
  
  func showMarker(position: CLLocationCoordinate2D){
      let marker = GMSMarker()
      marker.position = position
      marker.title = "Palo Alto"
      marker.snippet = "San Francisco"
      marker.map = mapView
  }
  
  final func setupMapView() {
    view.addSubview(mapView)
    
    mapView.delegate = self
    
    mapView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([mapView.topAnchor.constraint(equalTo: view.topAnchor),
                                 mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 mapView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                                 mapView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)])
  }
}

extension MapViewController: GMSMapViewDelegate {
    
}

