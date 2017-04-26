//
//  MapViewController.swift
//  BartApp
//
//  Created by Josh Jeong on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let locationManager = CLLocationManager()
    
    var stations: [BartStation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bartStations = appDelegate.allBartStations
        stations = [bartStations[0], bartStations[3], bartStations[7]]
        pinStationsToMap()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getLocation()
    }
    
    func pinStationsToMap() {
        for station in stations {
            let annotation = MKPointAnnotation()
            if let stationName = station.name {
                annotation.title = stationName
            }
            
            if let coordinates = station.stationCoordinate {
                annotation.coordinate = coordinates
            }
            
            mapView.addAnnotation(annotation)
        }
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func getLocation() {
        let status = CLLocationManager.authorizationStatus()
        
        switch  status {
//        case .authorizedAlways:
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .denied, .restricted, .authorizedWhenInUse:
            let alert = UIAlertController(title: "Oops", message: "Please select \"Always\" from the Allow Location Access options", preferredStyle: .alert)
            let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            alert.addAction(openAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
            break
        default:
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
}
