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
import UserNotifications
import AVFoundation

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var departingTimeLabel: UILabel!
    @IBOutlet weak var arrivalTimeLabel: UILabel!
    @IBOutlet weak var departingStationLabel: UILabel!
    @IBOutlet weak var arrivalStationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startingTimeWrapperView: UIView!
    @IBOutlet weak var endingTimeWrapperView: UIView!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let locationManager = CLLocationManager()
    let GEOFENCE_RADIUS = 400.0 //in meters
    var bartStations: [BartStation] = []
    var legs: [Leg] = []
    var stations: [BartStation] = []
    var trip: Trip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        bartStations = appDelegate.allBartStations
        setupLabels()
        addStations()
        initMap()
        styleHeaderView()
        UNUserNotificationCenter.current().delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !isMovingToParentViewController {
            stopMonitoringGeofications()
        }
    }
    
    func styleHeaderView() {
        startingTimeWrapperView.layer.backgroundColor = Style.primaryColor.cgColor
        endingTimeWrapperView.layer.backgroundColor = Style.primaryColor.cgColor
    }
    
    func setupLabels() {
        if let departureTime = trip?.departureTime {
            departingTimeLabel.text = departureTime
        }
        
        if let arrivalTime = trip?.arrivalTime {
            arrivalTimeLabel.text = arrivalTime
        }
        
        if let departureStationInitial = trip?.origin {
            if let stationIndex = BartStation.getIndex(initial: departureStationInitial) {
                let station = bartStations[stationIndex]
                if let stationName = station.name {
                    departingStationLabel.text = stationName
                }
            }
        }
        
        if let arrivalStationInitial = trip?.destination {
            if let stationIndex = BartStation.getIndex(initial: arrivalStationInitial) {
                let station = bartStations[stationIndex]
                if let stationName = station.name {
                    arrivalStationLabel.text = stationName
                }
            }
        }
    }
    
    func addStations() {
        for (index, leg) in legs.enumerated() {
            if index == 0 {
                if let stationIndex = BartStation.getIndex(initial: leg.origin!) {
                    let station = bartStations[stationIndex]
                    pinStationToMap(station: station)
                }
            }
            if let stationIndex = BartStation.getIndex(initial: leg.destination!) {
                let station = bartStations[stationIndex]
                stations.append(station)
                addGeofence(station: station)
                pinStationToMap(station: station)
            }
        }
    }
    
    func initMap() {
        mapView.showsUserLocation = true
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    func pinStationToMap(station: BartStation) {
        let annotation = MKPointAnnotation()
        if let stationName = station.name {
            annotation.title = stationName
        }
        
        if let coordinates = station.stationCoordinate {
            annotation.coordinate = coordinates
        }
        
        mapView.addAnnotation(annotation)
    }
    
    func addGeofence(station: BartStation) {
        let annotation = MKPointAnnotation()
        if let coordinates = station.stationCoordinate {
            annotation.coordinate = coordinates
            mapView.addAnnotation(annotation)
            let bartStation = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
            
            mapView?.add(MKCircle(center: bartStation, radius: GEOFENCE_RADIUS))
            startMonitoringGeotification(station: station)
        }
    }
    
    func startMonitoringGeotification(station: BartStation) {
        if !CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            print("Geofencing is not supported on this device")
            return
        }
        
        let region = regionWithGeotification(station: station)
        locationManager.startMonitoring(for: region)
    }
    
    func stopMonitoringGeofications() {
        for region in locationManager.monitoredRegions {
            locationManager.stopMonitoring(for: region)
        }
    }
    
    
    func regionWithGeotification(station: BartStation) -> CLCircularRegion {
        var region = CLCircularRegion()
        if let coordinates = station.stationCoordinate, let initial = station.initial {
            region = CLCircularRegion(center: coordinates, radius: GEOFENCE_RADIUS, identifier: initial)
            region.notifyOnEntry = true
//            region.notifyOnExit = true
        }
        
        return region
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func getLocation() {
        let status = CLLocationManager.authorizationStatus()
        
        switch  status {
        case .authorizedAlways:
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            break
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
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
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // Force map to follow user
//        let location = locationManager.location! as CLLocation
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        mapView.setRegion(region, animated: true)
//    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to track user's location: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        createLocalNotification()
    }
    
}

extension MapViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // is running in foreground
        completionHandler([.alert, .badge, .sound])
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // is running in backgrond
        completionHandler()
    }
    
    func createLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = String.localizedUserNotificationString(forKey: "Almost there!",
                                                               arguments: nil)
        content.body = String.localizedUserNotificationString(forKey: "You are now approaching your stop",
                                                              arguments: nil)
        content.sound = UNNotificationSound.default()
//        content.sound = UNNotificationSound(named: "MySound.aiff")
        let request = UNNotificationRequest(identifier: "StationAlarm", content: content, trigger: nil)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
        vibratePhone()
    }
    
    func vibratePhone() {
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return legs.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LegTableViewCell", for: indexPath) as! LegTableViewCell
        if indexPath.row >= legs.count {
            cell.isLast = true
            cell.leg = legs[indexPath.row  - 1]
            print("is last")
            
        } else {
            cell.leg = legs[indexPath.row]
        }
        
        if indexPath.row == 0 {
            cell.place = "first"
        } else if indexPath.row == legs.count {
            cell.place = "last"
        } else {
            cell.place = "middle"
        }
        
        if legs.count == 1  {
            cell.place = "single"
        }
        
        return cell
    }
}
