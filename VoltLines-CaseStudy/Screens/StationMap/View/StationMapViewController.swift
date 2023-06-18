//
//  StationMapViewController.swift
//  VoltLines-CaseStudy
//
//  Created by Yiğit Erdinç on 18.06.2023.
//

import UIKit
import CoreLocation
import GoogleMaps

class StationMapViewController: UIViewController {
  private var presenter: StationMapPresenter!

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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMapView()
    
    presenter = StationMapPresenter(view: self)
    presenter.checkLocationUpdates()
    presenter.styleMap()
    presenter.getStationList()
  }
}

extension StationMapViewController {
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

    NotificationCenter.default.addObserver(self, selector: #selector(tripBooked), name: Constants.bookedTripNotificationName, object: nil)
  }
}

extension StationMapViewController {
  @objc func listTripsTapped() {
    presenter.handleListTripsTapped()
  }

  @objc func tripBooked() {
    presenter.handleTripBooked()
  }
}

extension StationMapViewController: CLLocationManagerDelegate {
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    presenter.locationManagerDidChangeAuthorization(manager)
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    presenter.locationManager(manager, didUpdateLocations: locations)
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    presenter.locationManager(manager, didFailWithError: error)
  }
}

extension StationMapViewController: GMSMapViewDelegate {
  func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
    presenter.mapView(mapView, didTap: marker)
  }

  func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
    presenter.mapView(mapView, didCloseInfoWindowOf: marker)
  }


  func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
    presenter.mapView(mapView, didTapAt: coordinate)
  }
}
