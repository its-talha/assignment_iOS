//
//  ViewController.swift
//  LocationServicesAndMapKitDemo
//
//  Created by Mohammad Talha on 09/11/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController{
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var currentCoordinate: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        checkLocationServices()
    }
        
    func setLocationManager()
    {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
            
    func checkLocationServices()
    {
        if CLLocationManager.locationServicesEnabled()
        {
            setLocationManager()
            checkLocationAuthorization()
            addAnnotations()
        }
        else
        {
            locationManager.requestWhenInUseAuthorization()
        }
    }
        
        
    func checkLocationAuthorization()
    {
        switch  locationManager.authorizationStatus{
        case .authorizedWhenInUse:
            beginLocationUpdates(locationManager: locationManager)
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            beginLocationUpdates(locationManager: locationManager)
        @unknown default:
            fatalError()
        }
    }
        
    func addAnnotations()
    {
        let annotation1 = MKPointAnnotation()
        annotation1.title = "Anno_1"
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 19.089403, longitude: 72.890428)
            
        let annotation2 = MKPointAnnotation()
        annotation2.title = "Anno_2"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 19.064789, longitude:72.902401)
        
        let annotation3 = MKPointAnnotation()
        annotation2.title = "Anno_3"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 19.018710, longitude:72.850672)
        
        let annotation4 = MKPointAnnotation()
        annotation2.title = "Anno_4"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 18.998349, longitude:72.850457)
        
        let annotation5 = MKPointAnnotation()
        annotation2.title = "Anno_5"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 19.069476, longitude:72.842797)
        
        let arr = [annotation1,annotation2,annotation3,annotation4,annotation5]
        
        mapView.addAnnotations(arr)

    }
    func beginLocationUpdates(locationManager:CLLocationManager){
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)

    }
}

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager : CLLocationManager, didUpdateLocations locations:[CLLocation])
    {
        guard let latestLocation = locations.first else {
            return
        }
        if currentCoordinate == nil{
            zoomToLatestLocation(with: latestLocation.coordinate)
        }
        currentCoordinate = latestLocation.coordinate
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager, didChangeAuthorization status : CLAuthorizationStatus) {
            
    }
}


