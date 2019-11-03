//
//  ViewController.swift
//  Project16
//
//  Created by Andrew Lundy on 10/31/19.
//  Copyright © 2019 Andrew Lundy. All rights reserved.
//

import UIKit
import MapKit
import WebKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var webView: WKWebView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the City of Light.")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it.")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself.")
        let phoenix = Capital(title: "Phoenix", coordinate: CLLocationCoordinate2D(latitude: 33.4484, longitude: -112.0740), info: "Phoenix is home.")
        
        mapView.addAnnotation(london)
        mapView.addAnnotation(oslo)
        mapView.addAnnotation(paris)
        mapView.addAnnotation(rome)
        mapView.addAnnotation(washington)
        mapView.addAnnotation(phoenix)
        
        
        
//        mapView.addAnnotations([london, oslo, paris, rome, washington])
        
    }
    
    func selectMapType() {
        let ac = UIAlertController(title: "Select Map Type", message: "", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Hybrid", style: .default, handler: { [weak self] alert in
            self?.mapView.mapType = .hybrid
        }))
        ac.addAction(UIAlertAction(title: "Satellite", style: .default, handler: { [weak self] alert in
            self?.mapView.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "Standard", style: .default, handler: { [weak self] alert in
            self?.mapView.mapType = .standard
        }))
        
        
        present(ac, animated: true)
    }

    @IBAction func infoBtnPressed(_ sender: Any) {
        selectMapType()
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
    
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.pinTintColor = UIColor.blue
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        return annotationView
        
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        let placeName = capital.title
        let placeInfo = capital.info
        
   
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

}

